#include <vector>
#include <cstring>
#include <algorithm>
#include <cstdlib>
#include <random>
#include <string>
#include <iostream>
#include <fstream>
#include <chrono>
#include <iomanip>
#include <sstream>
#include <stdbool.h>
#include <sys/time.h>
#include <omp.h>  // openmp头文件
#include <arm_neon.h>  // NEON指令集头文件
#include <mpi.h>  // mpi头文件
#define renum 3
#define size 4096
#define thread_num 2

float m0[size][size];
float m1[size][size];
alignas(16) float m2[size][size];
alignas(16) float m3[size][size];

std::mt19937 gen(350234);
std::uniform_real_distribution<float> dis(0.0f, 1.0f);

// 生成测试样例
void m_reset(int N)
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (j < i)
                m0[i][j] = 0;
            else if (j == i)
                m0[i][j] = 1.0;
            else
                m0[i][j] = dis(gen);  // 生成归一化的随机数避免溢出
            m1[i][j] = m0[i][j];  // 创建副本
        }  // 创建上三角矩阵作为基
    }

    for (int k = 0; k < N; k++)
        for (int i = k + 1; i < N; i++)
            for (int j = 0; j < N; j++)
                m1[i][j] += m0[k][j];  // 不同的行相加，使副本每行都是基的线性和，一定能消元至原三角矩阵

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            m2[i][j] = m1[i][j];  // 复制两份以对比串行/SIMD/多线程
            m3[i][j] = m1[i][j];
        }
    }
}

// 串行算法
void gauss_serial(int N)
{
    for (int k = 0; k < N; k++)
    {
        for (int j = k + 1; j < N; j++)
            m1[k][j] = m1[k][j] / m1[k][k];  // 除法（归一化）部分，可并行
        m1[k][k] = 1.0;
        for (int i = k + 1; i < N; i++)  // 消去部分，可并行
        {
            for (int j = k + 1; j < N; j++)
                m1[i][j] = m1[i][j] - m1[i][k] * m1[k][j];
            m1[i][k] = 0;
        }
    }
}

// openmp实现的多线程优化并行算法，表现最好的多线程算法，结合对齐SIMD技术
void gauss_openmp(int N)
{
    #pragma omp parallel if(N > 512) num_threads(thread_num)
    {
        for (int k = 0; k < N; k++)
        {
            #pragma omp single
            {
                float32x4_t vt = vdupq_n_f32(m2[k][k]);
                int j0 = k + 1;
                for (; j0 % 4 != 0 && j0 < N; j0++)
                    m2[k][j0] = m2[k][j0] / m2[k][k];
                for (; j0 + 4 <= N; j0 += 4)
                {
                    float32x4_t va = vld1q_f32(&m2[k][j0]);
                    va = vdivq_f32(va, vt);
                    vst1q_f32(&m2[k][j0], va);
                }
                for (int j = j0; j < N; j++)
                    m2[k][j] = m2[k][j] / m2[k][k];
                m2[k][k] = 1.0;
            }

            #pragma omp for schedule(guided)
            for (int i = k + 1; i < N; i++)
            {
                float32x4_t vaik = vdupq_n_f32(m2[i][k]);
                int j1 = k + 1;
                for (; j1 % 4 != 0 && j1 < N; j1++)
                    m2[i][j1] = m2[i][j1] - m2[i][k] * m2[k][j1];
                for (; j1 + 4 <= N; j1 += 4)
                {
                    float32x4_t vakj = vld1q_f32(&m2[k][j1]);
                    float32x4_t vaij = vld1q_f32(&m2[i][j1]);
                    float32x4_t vx = vmulq_f32(vakj, vaik);
                    vaij = vsubq_f32(vaij, vx);
                    vst1q_f32(&m2[i][j1], vaij);
                }
                for (int j = j1; j < N; j++)
                    m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];
                m2[i][k] = 0;
            }
        }
    }
}

int get_min(int N, int s, int r)
{
    return r * (N - N % s) / s;
}  // 给定N、s、r，计算区间最小值

int get_max(int N, int s, int r)
{
    return (r == s - 1 ? N : (r + 1) * (N - N % s) / s);
}  // 给定N、s、r，计算区间最大值

void gauss_mpi(int N)
{
    int s, r;
    MPI_Comm_size(MPI_COMM_WORLD, &s);  // 进程总数
    MPI_Comm_rank(MPI_COMM_WORLD, &r);  // 进程编号
    int min = get_min(N, s, r);
    int max = get_max(N, s, r);

    if (r == 0)
    {
        for (int i = 1; i < s; i++)
        {
            for (int j = get_min(N, s, i); j < get_max(N, s, i); j++)
                MPI_Send(&m3[j][0], N, MPI_FLOAT, i, j, MPI_COMM_WORLD);  // 主进程分发数据
        }
    }
    else
    {
        for (int i = min; i < max; i++)
            MPI_Recv(&m3[i][0], N, MPI_FLOAT, 0, i, MPI_COMM_WORLD, MPI_STATUS_IGNORE);  // 其余进程接受数据
    }

    #pragma omp parallel if(N > 512) num_threads(thread_num)
    {
        for (int k = 0; k < N; k++)
        {
            int root = std::min((k - k % ((N - N % s) / s)) / ((N - N % s) / s), s - 1);  // 计算k对应的r
            int begin = std::max(min, k + 1);
            std::vector<MPI_Request> req(s, MPI_REQUEST_NULL);
            #pragma omp master  // 规定由主线程执行，方便同步
            {
                if (k >= min && k < max)
                {
                    float32x4_t vt = vdupq_n_f32(m3[k][k]);
                    int j0 = k + 1;
                    for (; j0 % 4 != 0 && j0 < N; j0++)
                        m3[k][j0] = m3[k][j0] / m3[k][k];
                    for (; j0 + 4 <= N; j0 += 4)
                    {
                        float32x4_t va = vld1q_f32(&m3[k][j0]);
                        va = vdivq_f32(va, vt);
                        vst1q_f32(&m3[k][j0], va);
                    }
                    for (int j = j0; j < N; j++)
                        m3[k][j] = m3[k][j] / m3[k][k];
                    m3[k][k] = 1.0;

                    for (int j = r + 1; j < s; j++)
                        MPI_Isend(&m3[k][k], N - k, MPI_FLOAT, j, k, MPI_COMM_WORLD, &req[j]);  // 非阻塞发送给靠后的进程，靠前的进程无需同步
                }
                else if (k < min)
                {
                    MPI_Recv(&m3[k][k], N - k, MPI_FLOAT, root, k, MPI_COMM_WORLD, MPI_STATUS_IGNORE);  // 接收主元行
                }
            }

            #pragma omp barrier

            #pragma omp for schedule(guided) nowait
            for (int i = begin; i < max; i++)
            {
                float32x4_t vaik = vdupq_n_f32(m3[i][k]);
                int j1 = k + 1;
                for (; j1 % 4 != 0 && j1 < N; j1++)
                    m3[i][j1] = m3[i][j1] - m3[i][k] * m3[k][j1];
                for (; j1 + 4 <= N; j1 += 4)
                {
                    float32x4_t vakj = vld1q_f32(&m3[k][j1]);
                    float32x4_t vaij = vld1q_f32(&m3[i][j1]);
                    float32x4_t vx = vmulq_f32(vakj, vaik);
                    vaij = vsubq_f32(vaij, vx);
                    vst1q_f32(&m3[i][j1], vaij);
                }
                for (int j = j1; j < N; j++)
                    m3[i][j] = m3[i][j] - m3[i][k] * m3[k][j];
                m3[i][k] = 0;
            }

            #pragma omp master
            {
                for (int i = r + 1; i < s; i++)
                    if (req[i] != MPI_REQUEST_NULL)
                        MPI_Wait(&req[i], MPI_STATUS_IGNORE);  // 处理非阻塞通信
            }
        }
    }

    if (r == 0)
    {
        for (int i = 1; i < s; i++)
        {
            for (int j = get_min(N, s, i); j < get_max(N, s, i); j++)
                MPI_Recv(&m3[j][0], N, MPI_FLOAT, i, j, MPI_COMM_WORLD, MPI_STATUS_IGNORE);  // 接收其余进程的结果合并
        }
    }
    else
    {
        for (int i = min; i < max; i++)
            MPI_Send(&m3[i][0], N, MPI_FLOAT, 0, i, MPI_COMM_WORLD);  // 发送本进程结果
    }
}

bool m_cmp(int N)
{
    bool result = true;

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (m1[i][j] - m3[i][j] > 1e-6 || m3[i][j] - m1[i][j] > 1e-6)  // 差绝对值不超过1e-6认为相等
            {
                result = false;
                break;
            }
        }
    }

    return result;
}

int main(int argc, char *argv[])
{
    int provided;
    MPI_Init_thread(&argc, &argv, MPI_THREAD_FUNNELED, &provided);
    if (provided < MPI_THREAD_FUNNELED)
    {
        std::cout << "level: " << provided << std::endl;
        MPI_Finalize();
        return 0;
    }

    int s, r;
    MPI_Comm_size(MPI_COMM_WORLD, &s);
    MPI_Comm_rank(MPI_COMM_WORLD, &r);
    double Start, End, elapsed1 = 0.0, elapsed2 = 0.0, elapsed3 = 0.0;
    for (int n = 256; n <= size; n *= 2)
    {
        int unequal_count = renum;
        if (r == 0)
            std::cout << "size: " << n << std::endl;

        for (int i = 0; i < renum; i++)
        {
            if (r == 0)
            {
                m_reset(n);

                Start = MPI_Wtime();
                gauss_serial(n);
                End = MPI_Wtime();
                elapsed1 += End - Start;

                Start = MPI_Wtime();
                gauss_openmp(n);
                End = MPI_Wtime();
                elapsed2 += End - Start;
            }


            MPI_Barrier(MPI_COMM_WORLD);
            Start = MPI_Wtime();

            gauss_mpi(n);

            MPI_Barrier(MPI_COMM_WORLD);
            End = MPI_Wtime();
            elapsed3 += End - Start;

            
            if (r == 0)
            {
                if (m_cmp(n))
                    --unequal_count;
            }
        }

        if (r == 0)
        {
            std::cout << "unequal count: " << unequal_count << std::endl;
            std::cout << "serial average time: " << elapsed1 * 1000 / renum << " (ms)" << std::endl;
            std::cout << "simd+openmp average time: " << elapsed2 * 1000 / renum << " (ms)" << std::endl;
            std::cout << "mpi average time: " << elapsed3 * 1000 / renum << " (ms)" << std::endl;
            elapsed1 = 0.0;
            elapsed2 = 0.0;
            elapsed3 = 0.0;
        }
    }

    MPI_Finalize();
    return 0;
}
