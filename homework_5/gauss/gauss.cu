#include <cuda_runtime.h>
#include <stdio.h>
#define BLOCK_SIZE 1024

__global__ void division_kernel(float* data, int k, int N)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int totalthread = blockDim.x * gridDim.x;
    float kk = data[k * N + k];

    for (int i = k * N + k + 1 + idx; i < (k + 1) * N; i += totalthread)
    {
        data[i] /= kk;
    }
}

__global__ void eliminate_kernel(float* data, int k, int N)
{
    extern __shared__ float row_k[];
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    int totalblock = gridDim.x;
    int threadperblock = blockDim.x;
    if (tid == 0)
        data[k * N + k] = 1.0;

    for (int i = k + 1 + tid; i < N; i += threadperblock)
    {
        row_k[i - k - 1] = data[k * N + i];
    }
    __syncthreads();

    for (int row = k + 1 + bid; row < N; row += totalblock)
    {
        float ik = data[row * N + k];
        for (int col = k + 1 + tid; col < N; col += threadperblock)
        {
            float kj = row_k[col - k - 1];
            data[row * N + col] -= ik * kj;
        }
        if (tid == 0)
        {
            data[row * N + k] = 0.0;
        }
    }
}

void gauss_gpu(float *mat, int N)
{
    cudaError_t ret;
    for (int k = 0; k < N; k++)
    {
        dim3 dimGrid1((int) ((N - k) / BLOCK_SIZE) + 1, 1);
        dim3 dimBlock(BLOCK_SIZE, 1);

        division_kernel<<<dimGrid1, dimBlock>>>(mat, k, N);
        ret = cudaGetLastError();
        if (ret != cudaSuccess)
        {
            printf("division_kernel failed, %s\n",cudaGetErrorString(ret));
        }

        int x = N - k - 1 > 0 ? N - k - 1 : 1;
        dim3 dimGrid2(x, 1);
        eliminate_kernel<<<dimGrid2, dimBlock, x * sizeof(float)>>>(mat, k, N);
        ret = cudaGetLastError();
        if (ret != cudaSuccess)
        {
            printf("eliminate_kernel failed, %s\n",cudaGetErrorString(ret));
        }
    }
}