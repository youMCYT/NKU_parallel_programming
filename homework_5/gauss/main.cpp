#include <cuda_runtime.h>
#include <random>
#include <chrono>
#include <stdlib.h>
#include <iostream>
#define n 4096

void gauss_gpu(float *mat, int N);

std::mt19937 gen(350234);
std::uniform_real_distribution<float> dis(0.0f, 1.0f);

void gauss_cpu(float *mat, int N)
{
    for (int k = 0; k < N; k++)
    {
        for (int j = k + 1; j < N; j++)
            mat[k * N + j] /= mat[k * N + k];
        mat[k * N + k] = 1.0;
        for (int i = k + 1; i < N; i++)
        {
            for (int j = k + 1; j < N; j++)
                mat[i * N + j] -= mat[i * N + k] * mat[k * N + j];
            mat[i * N + k] = 0.0;
        }
    }
}

void m_reset(float *mat, int N)
{
    float *m0 = (float *) malloc(N * N * sizeof(float));

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (j < i)
                m0[i * N + j] = 0;
            else if (j == i)
                m0[i * N + j] = 1.0;
            else
                m0[i * N + j] = dis(gen);
            mat[i * N + j] = m0[i * N + j];
        }
    }

    for (int k = 0; k < N; k++)
        for (int i = k + 1; i < N; i++)
            for (int j = 0; j < N; j++)
                mat[i * N + j] += m0[k * N + j];

    free(m0);
}

bool m_cmp(float *m1, float *m2, int N)
{
    bool result = true;

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (m1[i * N + j] - m2[i * N + j] > 1e-6 || m2[i * N + j] - m1[i * N + j] > 1e-6)
            {
                result = false;
                break;
            }
        }
    }

    return result;
}

int main(void)
{
    std::chrono::duration<double, std::milli> elapsed1(0.0), elapsed2(0.0);
    std::chrono::high_resolution_clock::time_point Start, End;
    cudaError_t ret;

    float *cpu = (float *) malloc(n * n * sizeof(float));
    m_reset(cpu, n);

    float *gpu = (float *) malloc(n * n * sizeof(float));
    memcpy(gpu, cpu, n * n * sizeof(float));

    Start = std::chrono::high_resolution_clock::now();
    gauss_cpu(cpu, n);
    End = std::chrono::high_resolution_clock::now();
    elapsed1 += End - Start;

    cudaDeviceSynchronize();

    float *gpu_mat;
    ret = cudaMalloc(&gpu_mat, n * n * sizeof(float));
    if (ret != cudaSuccess)
    {
        printf("cudaMalloc failed, %s\n",cudaGetErrorString(ret));
    }
    cudaMemcpy(gpu_mat, gpu, n * n * sizeof(float), cudaMemcpyHostToDevice);

    Start = std::chrono::high_resolution_clock::now();
    gauss_gpu(gpu_mat, n);
    End = std::chrono::high_resolution_clock::now();
    elapsed2 += End - Start;

    cudaMemcpy(gpu, gpu_mat, n * n * sizeof(float), cudaMemcpyDeviceToHost);

    std::cout << "cpu time: " << elapsed1.count() << " (ms)" << std::endl;
    std::cout << "gpu time: " << elapsed2.count() << " (ms)" << std::endl;
    // std::cout << (m_cmp(cpu, gpu, n) ? "Equal" : "Not equal") << std::endl;

    free(cpu);
    free(gpu);
    cudaFree(gpu_mat);

    return 0;
}
