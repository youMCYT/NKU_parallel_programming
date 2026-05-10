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
#define renum 20
#define size 2048
#define tile 32

float m0[size][size];
float m1[size][size];
float m2[size][size];
float m3[size][size];
alignas(16) float m4[size][size];  // 对齐内存

std::random_device rd;
std::mt19937 gen(rd());
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
            m2[i][j] = m1[i][j];  // 复制三份以对比串行/SIMD/Cache优化/对齐
            m3[i][j] = m1[i][j];
            m4[i][j] = m1[i][j];
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

// SIMD算法
void gauss_simd(int N)
{
    for (int k = 0; k < N; k++)
    {
        float32x4_t vt = vdupq_n_f32(m2[k][k]);  // 加载4个m2[k][k]到向量寄存器
        int j0 = k + 1;
        for (; j0 + 4 <= N; j0 += 4)  // 处理每4个数，不处理余数
        {
            float32x4_t va = vld1q_f32(&m2[k][j0]);  // 从m2[k][j0]连续加载四个float到向量寄存器
            va = vdivq_f32(va, vt);  // 对位除法，等价于m2[k][j] = m2[k][j] / m2[k][k]
            vst1q_f32(&m2[k][j0], va);  // 存回数组
        }
        for (int j = j0; j < N; j++)
            m2[k][j] = m2[k][j] / m2[k][k];  // 按串行方式处理余数
        m2[k][k] = 1.0;
        for (int i = k + 1; i < N; i++)
        {
            float32x4_t vaik = vdupq_n_f32(m2[i][k]);  // 加载4个m2[i][k]到向量寄存器
            int j1 = k + 1;
            for (; j1 + 4 <= N; j1 += 4)  // 处理每4个数，不处理余数
            {
                float32x4_t vakj = vld1q_f32(&m2[k][j1]);  // 从m2[k][j1]连续加载四个float到向量寄存器
                float32x4_t vaij = vld1q_f32(&m2[i][j1]);  // 从m2[i][j1]连续加载四个float到向量寄存器
                float32x4_t vx = vmulq_f32(vakj, vaik);  // 对位乘法，等价于vx = m2[i][k] * m2[k][j]
                vaij = vsubq_f32(vaij, vx);  // 对位减法，等价于m2[i][j] = m2[i][j] - vx
                vst1q_f32(&m2[i][j1], vaij);  // 存回数组
            }
            for (int j = j1; j < N; j++)
                m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];  // 按串行方式处理余数
            m2[i][k] = 0;
        }
    }
}

// Cache优化后的SIMD算法
// 服务器鲲鹏920缓存：L1 64KB数据、64KB指令；L2 512KB；L3 每核1MB
// 考虑到float占4B，每行2K个float，即每行占8KB，L1过小，将L2大小作为分块大小参照
void gauss_simd_cache(int N)
{
    for (int k = 0; k < N; k++)
    {
        float32x4_t vt = vdupq_n_f32(m3[k][k]);
        int j0 = k + 1;
        for (; j0 + 4 <= N; j0 += 4)
        {
            float32x4_t va = vld1q_f32(&m3[k][j0]);
            va = vdivq_f32(va, vt);
            vst1q_f32(&m3[k][j0], va);
        }
        for (int j = j0; j < N; j++)
            m3[k][j] = m3[k][j] / m3[k][k];
        m3[k][k] = 1.0;
        // 以上部分只使用到k行，不参与分块
        // L2缓存可容纳64行
        int ii = k + 1;
        for (; ii + tile <= N; ii += tile)
        {
            for (int i = ii; i < ii + tile; i++)
            {
                float32x4_t vaik = vdupq_n_f32(m3[i][k]);
                int j1 = k + 1;
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
        }
        for (int i = ii; i < N; i++)  // 处理分块产生的余数
        {
            float32x4_t vaik = vdupq_n_f32(m3[i][k]);
            int j1 = k + 1;
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
    }
}

// 对齐的SIMD算法
void gauss_simd_align(int N)
{
    for (int k = 0; k < N; k++)
    {
        float32x4_t vt = vdupq_n_f32(m4[k][k]);
        int j0 = k + 1;  // 由于k不一定是4的倍数，将其手动对其到4的倍数
        for (; j0 % 4 != 0 && j0 < N; j0++)
            m4[k][j0] = m4[k][j0] / m4[k][k];
        for (; j0 + 4 <= N; j0 += 4)
        {
            float32x4_t va = vld1q_f32(&m4[k][j0]);
            va = vdivq_f32(va, vt);
            vst1q_f32(&m4[k][j0], va);
        }
        for (int j = j0; j < N; j++)
            m4[k][j] = m4[k][j] / m4[k][k];
        m4[k][k] = 1.0;
        for (int i = k + 1; i < N; i++)
        {
            float32x4_t vaik = vdupq_n_f32(m4[i][k]);
            int j1 = k + 1;  // 由于k不一定是4的倍数，将其手动对其到4的倍数
            for (; j1 % 4 != 0 && j1 < N; j1++)
                m4[i][j1] = m4[i][j1] - m4[i][k] * m4[k][j1];
            for (; j1 + 4 <= N; j1 += 4)
            {
                float32x4_t vakj = vld1q_f32(&m4[k][j1]);
                float32x4_t vaij = vld1q_f32(&m4[i][j1]);
                float32x4_t vx = vmulq_f32(vakj, vaik);
                vaij = vsubq_f32(vaij, vx);
                vst1q_f32(&m4[i][j1], vaij);
            }
            for (int j = j1; j < N; j++)
                m4[i][j] = m4[i][j] - m4[i][k] * m4[k][j];
            m4[i][k] = 0;
        }
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
            if (m1[i][j] - m4[i][j] > 1e-6 || m4[i][j] - m1[i][j] > 1e-6)
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
    std::chrono::duration<double, std::milli> elapsed1(0.0), elapsed2(0.0), elapsed3(0.0), elapsed4(0.0);
    std::chrono::high_resolution_clock::time_point Start, End;
    for (int n = 4; n <= size; n *= 2)
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
            gauss_simd_cache(n);
            End = std::chrono::high_resolution_clock::now();
            elapsed3 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
            gauss_simd_align(n);
            End = std::chrono::high_resolution_clock::now();
            elapsed4 += End - Start;

            if (m_cmp(n))
                --unequal_count;
        }
        std::cout << "unequal count: " << unequal_count << std::endl;
        std::cout << "serial average time: " << elapsed1.count() / renum << " (ms)" << std::endl;
        std::cout << "simd average time: " << elapsed2.count() / renum << " (ms)" << std::endl;
        std::cout << "cache average time: " << elapsed3.count() / renum << " (ms)" << std::endl;
        std::cout << "alignment average time: " << elapsed4.count() / renum << " (ms)" << std::endl << std::endl;
        elapsed1.zero();
        elapsed2.zero();
        elapsed3.zero();
        elapsed4.zero();
    }
    return 0;
}
