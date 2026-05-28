#include <vector>
#include <cstring>
#include <cstdlib>
#include <random>
#include <string>
#include <iostream>
#include <fstream>
#include <chrono>
#include <iomanip>
#include <sstream>
#include <sys/time.h>
#include <omp.h>  // openmp头文件
#include <arm_neon.h>  // NEON指令集头文件
#define size 4096
#define thread_num 8

float m0[size][size];
alignas(16) float m1[size][size];

std::mt19937 gen(350234);
std::uniform_real_distribution<float> dis(0.0f, 1.0f);

std::vector<std::chrono::duration<double, std::milli>> thread_time(thread_num, std::chrono::duration<double, std::milli>(0.0));
std::chrono::duration<double, std::milli> elapsed(0.0);

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
}

// openmp实现的多线程优化并行算法
void gauss_openmp(int N)
{
    std::chrono::high_resolution_clock::time_point e_S, e_E;
    e_S = std::chrono::high_resolution_clock::now();

    #pragma omp parallel if(N > 512) num_threads(thread_num)
    {
        int t_id = omp_get_thread_num();
        std::chrono::duration<double, std::milli> t(0.0);

        for (int k = 0; k < N; k++)
        {
            std::chrono::high_resolution_clock::time_point Start, End;

            Start = std::chrono::high_resolution_clock::now();

            #pragma omp single nowait
            {
                float32x4_t vt = vdupq_n_f32(m1[k][k]);
                int j0 = k + 1;
                for (; j0 % 4 != 0 && j0 < N; j0++)
                    m1[k][j0] = m1[k][j0] / m1[k][k];
                for (; j0 + 4 <= N; j0 += 4)
                {
                    float32x4_t va = vld1q_f32(&m1[k][j0]);
                    va = vdivq_f32(va, vt);
                    vst1q_f32(&m1[k][j0], va);
                }
                for (int j = j0; j < N; j++)
                    m1[k][j] = m1[k][j] / m1[k][k];
                m1[k][k] = 1.0;
            }

            End = std::chrono::high_resolution_clock::now();
            t += End - Start;

            #pragma omp barrier

            Start = std::chrono::high_resolution_clock::now();

            #pragma omp for schedule(static) nowait
            for (int i = k + 1; i < N; i++)
            {
                float32x4_t vaik = vdupq_n_f32(m1[i][k]);
                int j1 = k + 1;
                for (; j1 % 4 != 0 && j1 < N; j1++)
                    m1[i][j1] = m1[i][j1] - m1[i][k] * m1[k][j1];
                for (; j1 + 4 <= N; j1 += 4)
                {
                    float32x4_t vakj = vld1q_f32(&m1[k][j1]);
                    float32x4_t vaij = vld1q_f32(&m1[i][j1]);
                    float32x4_t vx = vmulq_f32(vakj, vaik);
                    vaij = vsubq_f32(vaij, vx);
                    vst1q_f32(&m1[i][j1], vaij);
                }
                for (int j = j1; j < N; j++)
                    m1[i][j] = m1[i][j] - m1[i][k] * m1[k][j];
                m1[i][k] = 0;
            }

            End = std::chrono::high_resolution_clock::now();
            t += End - Start;

            #pragma omp barrier
        }

        thread_time[t_id] += t;
    }

    e_E = std::chrono::high_resolution_clock::now();
    elapsed += e_E - e_S;
}

int main(int argc, char *argv[])
{
    std::chrono::duration<double, std::milli> total(0.0);
    m_reset(size);

    gauss_openmp(size);

    for (int i = 0; i < thread_num; i++)
    {
        std::cout << "thread " << i << ": " << thread_time[i].count() << " (ms)" << std::endl;
        total += thread_time[i];
    }

    std::cout << "elapsed: " << elapsed.count() << " (ms)" << std::endl;
    std::cout << "total: " << total.count() << " (ms)" << std::endl;

    return 0;
}
