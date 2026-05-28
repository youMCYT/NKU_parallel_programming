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
#include <omp.h>
#include <arm_neon.h>  // NEON指令集头文件
#include <pthread.h>  // pthread头文件
#include <semaphore.h> // 信号量头文件
#define renum 3
#define size 4096
#define thread_num 8

float m0[size][size];
float m1[size][size];
alignas(16) float m2[size][size];
alignas(16) float m3[size][size];

std::mt19937 gen(350234);
std::uniform_real_distribution<float> dis(0.0f, 1.0f);

// 定义参数结构用于向线程函数传参
struct threadParam_t
{
    int k;
    int t_id;
    int N;

    threadParam_t(int k, int t_id, int N): k(k), t_id(t_id), N(N) {}
    threadParam_t(int t_id, int N): k(0), t_id(t_id), N(N) {}
    threadParam_t(int N): k(0), t_id(0), N(N) {}
    threadParam_t(): k(0), t_id(0), N(0) {}
};

// 定义信号量
sem_t sem_main;
sem_t sem_workstart[thread_num];
sem_t sem_workend[thread_num];

// 静态线程+信号量同步实现的线程函数
void *threadFuncStatic(void *param)
{
    threadParam_t *p = (threadParam_t*) param;
    int t_id = p->t_id;
    int N = p->N;

    for (int k = 0; k < N; k++)
    {
        sem_wait(&sem_workstart[t_id]);
        for (int i = k + 1 + t_id; i < N; i += thread_num)
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
        sem_post(&sem_main);
        sem_wait(&sem_workend[t_id]);
    }
    pthread_exit(NULL);
}

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

// SIMD算法，采用SIMD实验中表现最好的算法
void gauss_simd(int N)
{
    for (int k = 0; k < N; k++)
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

// 静态线程+信号量同步实现的多线程优化并行算法
void gauss_pthread(int N)
{
    sem_init(&sem_main, 0, 0);
    for (int i = 1; i < thread_num; i++)
    {
        sem_init(&sem_workstart[i], 0, 0);
        sem_init(&sem_workend[i], 0, 0);
    }

    std::vector<pthread_t> handles(thread_num);
    std::vector<threadParam_t> param(thread_num);
    for (int t_id = 1; t_id < thread_num; t_id++)
    {
        param[t_id].t_id = t_id;
        param[t_id].N = N;
        pthread_create(&handles[t_id], NULL, threadFuncStatic, &param[t_id]);
    }

    for (int k = 0; k < N; k++)
    {
        int j0 = k + 1;
        for (; j0 % 4 != 0 && j0 < N; j0++)
            m3[k][j0] = m3[k][j0] / m3[k][k];
        float32x4_t vt = vdupq_n_f32(m3[k][k]);
        for (; j0 + 4 <= N; j0 += 4)
        {
            float32x4_t va = vld1q_f32(&m3[k][j0]);
            va = vdivq_f32(va, vt);
            vst1q_f32(&m3[k][j0], va);
        }
        for (int j = j0; j < N; j++)
            m3[k][j] = m3[k][j] / m3[k][k];
        m3[k][k] = 1.0;

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_post(&sem_workstart[t_id]);

        for (int i = k + 1; i < N; i += thread_num)
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

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_wait(&sem_main);

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_post(&sem_workend[t_id]);
    }

    for (int t_id = 1; t_id < thread_num; t_id++)
        pthread_join(handles[t_id], NULL);

    sem_destroy(&sem_main);
    for (int i = 1; i < thread_num; i++)
    {
        sem_destroy(&sem_workstart[i]);
        sem_destroy(&sem_workend[i]);
    }
}

bool m_cmp(int N)
{
    bool result = true;

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (m1[i][j] - m2[i][j] > 1e-6 || m2[i][j] - m1[i][j] > 1e-6)  // 差绝对值不超过1e-6认为相等
            {
                result = false;
                break;
            }
            if (m1[i][j] - m3[i][j] > 1e-6 || m3[i][j] - m1[i][j] > 1e-6)
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
    std::chrono::duration<double, std::milli> elapsed1(0.0), elapsed2(0.0), elapsed3(0.0);
    std::chrono::high_resolution_clock::time_point Start, End;
    for (int n = 256; n <= size; n *= 2)
    {
        std::cout << "size: " << n << std::endl;
        int unequal_count = renum;
        for (int i = 0; i < renum; i++)
        {
            m_reset(n);
            Start = std::chrono::high_resolution_clock::now();
            gauss_serial(n);
            End = std::chrono::high_resolution_clock::now();
            elapsed1 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
            gauss_simd(n);
            End = std::chrono::high_resolution_clock::now();
            elapsed2 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
            gauss_pthread(n);
            End = std::chrono::high_resolution_clock::now();
            elapsed3 += End - Start;

            if (m_cmp(n))
                --unequal_count;
        }
        std::cout << "unequal count: " << unequal_count << std::endl;
        std::cout << "serial average time: " << elapsed1.count() / renum << " (ms)" << std::endl;
        std::cout << "simd average time: " << elapsed2.count() / renum << " (ms)" << std::endl;
        std::cout << "static average time: " << elapsed3.count() / renum << " (ms)" << std::endl;
        elapsed1.zero();
        elapsed2.zero();
        elapsed3.zero();
    }

    return 0;
}
