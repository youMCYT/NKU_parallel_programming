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
#include <pthread.h>  // pthread头文件
#include <arm_neon.h>  // NEON指令集头文件
#include <semaphore.h> // 信号量头文件
#define size 4096
#define thread_num 2

float m0[size][size];
alignas(16) float m1[size][size];

std::mt19937 gen(350234);
std::uniform_real_distribution<float> dis(0.0f, 1.0f);

std::vector<std::chrono::duration<double, std::milli>> thread_time(thread_num, std::chrono::duration<double, std::milli>(0.0));
std::chrono::duration<double, std::milli> elapsed(0.0);

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
    std::chrono::duration<double, std::milli> t(0.0);

    for (int k = 0; k < N; k++)
    {
        std::chrono::high_resolution_clock::time_point Start, End;
        sem_wait(&sem_workstart[t_id]);
        Start = std::chrono::high_resolution_clock::now();
        for (int i = k + 1 + t_id * (N - k - 1) / thread_num; (t_id == thread_num - 1 && i < N) || (t_id < thread_num - 1 && i < k + 1 + (t_id + 1) * (N - k - 1) / thread_num); i++)
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
        sem_post(&sem_main);
        sem_wait(&sem_workend[t_id]);
    }

    thread_time[t_id] += t;
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
}

// 静态线程+信号量同步实现的多线程优化并行算法
void gauss_pthread(int N)
{
    std::chrono::high_resolution_clock::time_point Start, End;
    Start = std::chrono::high_resolution_clock::now();
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

    std::chrono::duration<double, std::milli> t(0.0);
    for (int k = 0; k < N; k++)
    {
        std::chrono::high_resolution_clock::time_point t_S, t_E;
        t_S = std::chrono::high_resolution_clock::now();

        int j0 = k + 1;
        for (; j0 % 4 != 0 && j0 < N; j0++)
            m1[k][j0] = m1[k][j0] / m1[k][k];
        float32x4_t vt = vdupq_n_f32(m1[k][k]);
        for (; j0 + 4 <= N; j0 += 4)
        {
            float32x4_t va = vld1q_f32(&m1[k][j0]);
            va = vdivq_f32(va, vt);
            vst1q_f32(&m1[k][j0], va);
        }
        for (int j = j0; j < N; j++)
            m1[k][j] = m1[k][j] / m1[k][k];
        m1[k][k] = 1.0;

        t_E = std::chrono::high_resolution_clock::now();
        t += t_E - t_S;

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_post(&sem_workstart[t_id]);

        t_S = std::chrono::high_resolution_clock::now();

        for (int i = k + 1; (thread_num == 1 && i < N) || (thread_num > 1 && i < k + 1 + (N - k - 1) / thread_num); i++)
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

        t_E = std::chrono::high_resolution_clock::now();
        t += t_E - t_S;

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_wait(&sem_main);

        for (int t_id = 1; t_id < thread_num; t_id++)
            sem_post(&sem_workend[t_id]);
    }

    thread_time[0] += t;

    for (int t_id = 1; t_id < thread_num; t_id++)
        pthread_join(handles[t_id], NULL);

    sem_destroy(&sem_main);
    for (int i = 1; i < thread_num; i++)
    {
        sem_destroy(&sem_workstart[i]);
        sem_destroy(&sem_workend[i]);
    }
    End = std::chrono::high_resolution_clock::now();
    elapsed += End - Start;
}

int main(int argc, char *argv[])
{
    std::chrono::duration<double, std::milli> total(0.0);
    m_reset(size);

    gauss_pthread(size);

    for (int i = 0; i < thread_num; i++)
    {
        std::cout << "thread " << i << ": " << thread_time[i].count() << " (ms)" << std::endl;
        total += thread_time[i];
    }

    std::cout << "elapsed: " << elapsed.count() << " (ms)" << std::endl;
    std::cout << "total: " << total.count() << " (ms)" << std::endl;

    return 0;
}
