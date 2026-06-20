# Lab 1
## Ex
Fill in the global index for each thread:

| blockIdx.x | blockDim.x | threadIdx.x | Global Index |
|:-----------|:-----------|:------------|:-------------|
| 0 | 256 | 100 | 100 |
| 2 | 128 | 50 | 306 |
| 5 | 64 | 0 | 320 |
## Ex 1
Based on the output above, record your GPU's specifications:

| Property | Your GPU Value | Significance |
|:---------|:---------------|:-------------|
| Device Name | AMD Radeon 890M Graphics | GPU model identifier |
| Compute Units | 16 | Number of parallel execution units |
| Wavefront Size | 32 | Threads per warp (**32 on RDNA**, 64 on CDNA) |
| Max Threads per Block | 1024 | Upper limit for blockDim |
| Max Shared Memory per Block | 64KB | LDS available per block |

**Question**: How many total threads can your GPU execute simultaneously if all CUs are fully utilized?

Your calculation: 20480
## Ex 2
原文件已经是正确的实现。
## Ex 3
Given `N = 1000` elements, complete the table:

| Block Size | Grid Size Formula | Grid Size | Total Threads | Idle Threads |
|:-----------|:------------------|:----------|:--------------|:-------------|
| 64 | ceil(1000/64) | 16 | 1024 | 24 |
| 128 | ceil(1000/128) | 8 | 1024 | 24 |
| 256 | ceil(1000/256) | 4 | 1024 | 24 |
| 512 | ceil(1000/512) | 2 | 1024 | 24 |

**Question**: Which block size gives the best thread utilization? Why might this not always be the best choice?

Your answer: 无论什么样的块大小线程利用率都相同。
## Ex 4
Based on the multi-trial results above:

1. Which block size achieved the **lowest mean execution time**? 1024
2. Which block size achieved the **highest memory bandwidth**? 1024
3. Are the differences between block sizes **statistically significant** (look at error bars)?  没有
4. Why does Vector Add performance depend more on bandwidth than on block size?

Your answer: 向量相加在读写上的开销远大于在计算上的开销。
## Ex 5
**Question 1**: A kernel is launched with block size 100. How many wavefronts does each block require? How many lanes are wasted?

- Wavefronts per block: 4 (hint: $\lceil 100/32 \rceil$)
- Wasted lanes: 28 (hint: wavefronts × 32 − 100)

**Question 2**: If the same kernel were compiled with `-mwavefrontsize64`, how would the answers change?

- Wavefronts per block (wave64): 2 (hint: $\lceil 100/64 \rceil$)
- Wasted lanes (wave64): 28

**Question 3**: What happens when threads within a wavefront take different branches (if-else)?

Your answer: 如果分支不同，会先执行分支为A的线程，再执行分支为B的线程，依次类推。这一过程是串行的。
## Ex 6
**For Radeon 8060S (RDNA 3.5)**: 20 CUs, Warp Size = 32, Max Blocks per CU = 64, Max Threads per Block = 1024

To calculate occupancy, you need to know the max wavefronts per CU (check `rocminfo` output).

| Block Size | Wavefronts/Block | Blocks that fit | Active Wavefronts | Notes |
|:-----------|:-----------------|:----------------|:------------------|:------|
| 32 | 1 | 40 | 40 | 受wavefront限制 |
| 64 | 2 | 20 | 40 | 未受wavefront限制 |
| 128 | 4 | 10 | 40 | 未受wavefront限制 |
| 256 | 8 | 5 | 40 | 未受wavefront限制 |
| 512 | 16 | 2 | 32 | 受wavefront限制 |
| 1024 | 32 | 1 | 32 | 受wavefront限制 |

**Note**: Use `rocminfo` output from Exercise 1 to determine actual hardware limits for your device.
## Ex 7
Based on the multi-trial results above:

- Mean time for block size 8 (sub-wave): 0.205 ms
- Mean time for block size 16 (sub-wave): 0.145 ms
- Mean time for block size 32 (wave-aligned): 0.135 ms
- Mean time for block size 256 (large): 0.155 ms

**Question 1**: Is there a noticeable performance penalty for sub-wavefront block sizes (8, 16) compared to wave-aligned sizes (32, 64, 128)?

Your answer: 是。

**Question 2**: On this RDNA 3.5 GPU, the wavefront size is 32. If you were on an MI100 (wavefront = 64), which block sizes would become sub-wavefront?

Your answer: 8、16、32。
# Lab 2
## Ex 1
Given `blockDim = (32, 32)`, calculate the global indices:

| blockIdx | threadIdx | Global (idx, idy) |
|:---------|:----------|:------------------|
| (0, 0) | (5, 10) | (5, 10) |
| (1, 0) | (0, 0) | (32, 0) |
| (2, 3) | (15, 20) | (79, 116) |

**Question**: For a matrix with `rows=100, cols=200`, how many blocks are needed?

Your calculation: 28
## Ex 2
For a 4×6 matrix (rows=4, cols=6), fill in the table:

| Thread (idx, idy) | Input Index | Output Index |
|:------------------|:------------|:-------------|
| (0, 0) | 0*6+0 = 0 | 0*4+0 = 0 |
| (1, 0) | 0*6+1 = 1 | 1*4+0 = 4 |
| (0, 1) | 1*6+0 = 6 | 0*4+1 = 1 |
| (3, 2) | 2*6+3 = 15 | 3*4+2 = 14 |

**Question**: Why is the write index formula `idx * rows + idy` instead of `idx * cols + idy`?

Your answer: 转置后的矩阵列与行是原矩阵的行与列，需要变换位移。
## Ex 3
Record execution times:

| Test | Dimensions | Elements | Time |
|:-----|:-----------|:---------|:-----|
| 1 | 16×16 | 256 | 0.0076 |
| 2 | 128×32 | 4,096 | 0.0102 |
| 3 | 1×1024 | 1,024 | 0.0087 |
| 4 | 1001×2001 | 2,003,001 | 0.2382 |

**Question**: The large test has ~500x more elements than test 2. Is the time 500x longer? Why or why not?

Your answer: 比500x短得多，因为在小测试中性能开销的主要部分是启动开销而不是运行时的性能开销，运行时的性能开销翻500倍也远远比不上原开销的500倍。
## Ex 4
For a 1024×1024 matrix with 32×32 thread blocks (one wave32 = one row of the block):

**Question 1**: When reading `input[idy * cols + idx]`, are consecutive threads (in `threadIdx.x`) reading consecutive addresses?

Your answer: 是。

**Question 2**: When writing `output[idx * rows + idy]`, what is the stride between addresses written by consecutive threads?

Your answer: 4096字节。

**Question 3**: If each memory transaction fetches 128 bytes (32 floats), how many transactions are needed for 32 threads (one wavefront) to write non-coalesced?

Your answer: 32。
## Ex 5
**Question 1**: Why do we add `+1` to the shared memory declaration (`tile[BLOCK_SIZE][BLOCK_SIZE + 1]`)?

Your answer: 让每行的长度与wavefront的大小互质，以免转置后每次访问不同的行，破坏存储连续性，影响性能。

**Question 2**: In the write step, why do we swap blockIdx.x and blockIdx.y?

Your answer: 转置后，输出矩阵的坐标与输入矩阵的坐标恰好相反。

**Question 3**: How much shared memory does each block use for BLOCK_SIZE=32?

Your calculation: 4224字节。
# Lab 3
## Ex 1
**Question 1**: How many times is each input element read from global memory?

Your answer: num_bins。

**Question 2**: If num_bins = 256 and N = 10M, what is the total global memory traffic?

Your calculation: 2560000000。

**Question 3**: Why is this approach inefficient?

Your answer: 每回合都对整个数组进行读取，造成了大量的读写开销。
## Ex 2
**Question 1**: Why is atomicAdd on shared memory faster than on global memory?

Your answer: 共享内存与运算单元的物理距离更近，竞争也仅在块内竞争，有更好的性能。

**Question 2**: In the merge step, how many global atomicAdd operations occur per bin?

Your answer: gridDim.x。

**Question 3**: What is the purpose of the grid-stride loop pattern `for (int i = idx; i < N; i += totalthread)`?

Your answer: 避免N大于线程总数无法完全覆盖，充分利用线程的计算资源。
## Ex 3
Fill in the execution times:

| Implementation | Time (testcase 2) | Time (testcase 4) |
|:---------------|:------------------|:------------------|
| Serial (CPU) | 2.3822ms | 22.4082ms |
| Naive GPU | 16.1138ms | 2576.3120ms |
| Optimized GPU | 0.4563ms | 4.4518ms |

Calculate speedups:

- Optimized vs Serial: 5.04 x
- Optimized vs Naive: 527.99 x
## Ex 4
**Question**: Calculate the memory traffic reduction ratio:

$$
\text{Reduction} = \frac{\text{Naive reads}}{\text{Optimized reads}} = \frac{N \times \text{num\_bins}}{N} = ?
$$

Your answer: num_bins。
## Ex 5
**Scenario 1**: All input values are the same (e.g., all zeros)

- What happens to performance? 性能表现差。
- Why? 所有的线程更新同一个桶，造成大量竞争。

**Scenario 2**: Input values are uniformly distributed across all bins

- Expected contention level: 性能表现好。
- Why? 大约N / num_bins 个线程更新同一个桶，竞争更少。
# Lab 4
## Ex 1
**Question 1**: For an array of 1024 elements with block size 256, how many reduction steps occur within each block?

Your answer: 8。

**Question 2**: After block-level reduction, how many partial sums remain?

Your answer: 4。

**Question 3**: Why do we use `__syncthreads()` after each reduction step?

Your answer: 屏障同步，等待块内所有的线程完成计算再继续。
## Ex 2
From the test output, fill in the table:

| Block Size | Warps/Block | Occupancy (%) | Execution Time (ms) |
|:-----------|:------------|:--------------|:--------------------|
| 64 | 2 | 100 | 99 |
| 128 | 4 | 100 | 100 |
| 256 | 8 | 100| 98 |
| 512 | 16 | 80 | 105 |
| 1024 | 32 | 80 | 100 |

**Question**: Does higher occupancy always mean better performance?

Your answer: 不。
## Ex 3
**Question 1**: With block size 64, how many final atomic operations occur for N = 1M elements?

Calculation: grid_size = ceil(1,000,000 / 64) = 15625

**Question 2**: With block size 1024, how many final atomic operations occur?

Calculation: grid_size = ceil(1,000,000 / 1024) = 977

**Question 3**: Why might fewer atomic operations improve performance?

Your answer: 更少的竞争。
## Ex 4
**Question 1**: In tree reduction, what fraction of threads are idle after the first step?

Your answer: 50%。

**Question 2**: Why does warp shuffle not require `__syncthreads()`?

Your answer: __shfl_down()已经隐性包含了同步，不需要额外同步。

**Question 3**: How does multi-element per thread improve memory bandwidth utilization?

Your answer: 提高对线程计算资源的利用，尽可能减少原子操作数量。
# Lab 5
## Ex 1
**Question 1**: Why is the division by `n_samples` done in each thread instead of once at the end?

Your answer: 因为atomicAdd()只支持加法原子操作，需要在线程内进行除法后再进行原子相加。这样也能避免相加后丢失一部分精度。

**Question 2**: What is the time complexity of the atomic reduction approach?

Your answer: O(N)。

**Question 3**: How could you modify this kernel to use shared memory reduction instead of atomics?

Your answer: 
```cpp
__global__ void montecarlo(const double* y_samples, double* result, 
                           double a, double b, int n_samples) {
    __shared__ double sdata[256];
    
    int tid = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalthread = blockDim.x * gridDim.x;
    
    double sum = 0.0;
    for (int i = idx; i < n_samples; i += totalthread) {
        sum += y_samples[i];
    }
    sdata[tid] = sum;
    __syncthreads();
    
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }
    
    if (tid == 0) {
        atomicAdd(result, (b - a) * sdata[0] / n_samples);
    }
}
```
## Ex 2
For Test 1, verify the result manually:

Given: $a = 0$, $b = 2$, $n = 8$ samples

Formula: $\text{result} = \frac{(b-a)}{n} \sum_{i=1}^{n} y_i = \frac{2}{8} \times \sum y_i$

Your calculation:
- Sum of y values: 23.7507
- Expected result: 5.937675
- Does it match the program output? 是。
## Ex 3
Record the execution times:

| Test | Sample Count | Execution Time |
|:-----|:-------------|:---------------|
| 4 | 100,000 | 0.110 |
| 7 | 10,000,000 | 0.944 |
| 8 | 100,000,000 | 8.288 |

**Question 1**: When sample count increases 100x (from test 4 to 7), how much does execution time increase?

Your answer: 8.58x。

**Question 2**: Is the scaling linear? Why or why not?

Your answer: 并不是线性的，受到启动开销和竞争的影响。
## Ex 4
**Question 1**: If the computation takes 1 cycle and atomic takes 100 cycles, what is the theoretical efficiency for N=1M threads?

Hint: Total work = N x (compute + atomic)

Your calculation: 101000000。

**Question 2**: How would shared memory reduction improve this?

Your answer: 树形归约可以将时间复杂度从O(N)降低到O(logN)。

**Question 3**: With 256 threads per block and N=1M, how many global atomics would shared memory reduction require?

Your calculation: 3907。
## Ex 5
**Question 1**: The kernel uses `double` (64-bit). How many significant digits does double precision provide?

Your answer: 15-16位精度。

**Question 2**: If we switch to `float` (32-bit), what problems might occur with N=100M samples?

Your answer: float数据类型有更小的精度，大量float类数据相加会造成更大的数据误差。
## Ex 6
**Question 1**: In the optimized version, how many global atomics occur for N=1M with 256 blocks?

Your answer: 3907。

**Question 2**: What is the purpose of the grid-stride loop `for (int i = idx; i < n_samples; i += blockDim.x * gridDim.x)`?

Your answer: 避免N大于线程总数无法完全覆盖，充分利用线程的计算资源。

**Question 3**: Why is `(b - a) / n_samples` multiplication done only by thread 0?

Your answer: 减少计算的开销。
# Lab 6
## Ex 1
**Question 1**: In the assignment kernel, what is the time complexity per thread if k = 100?

Your answer: O(k)。

**Question 2**: Why does the recalculation kernel use shared memory atomics before global atomics?

Your answer: 用共享内存存储一部分临时数据，减少原子操作的数量以提升性能。

**Question 3**: What happens if a centroid has no points assigned to it (empty cluster)?

Your answer: 因为count = 0，这一簇永远不会更新。
## Ex 2
Record the execution time for test 4:

- Sample size: 50,000
- Clusters (k): 50
- Max iterations: 100
- Execution time: 0.104s

**Question**: What is the dominant computation in each iteration?

Your answer: find_nearest_centroids_kernel()
## Ex 3
For N = 50,000 points and k = 50 clusters:

**Assignment kernel:**
- Distance calculations per point: 50
- Total distance calculations: 2500000

**Update kernel:**
- Shared memory atomics: 150000
- Global atomics (with 256 threads/block): 29400
## Ex 4
**Question 1**: The centroids are read by every thread. How could you optimize this access pattern?

Your answer: 通过共享内存记录质心，减少读写带来的性能开销。

**Question 2**: If k = 1000, what would be the impact on cache performance?

Your answer: 每行占据16000字节的内存，对缓存造成很大压力，缓存的连续性被破坏导致缓存表现不佳。
## Ex 5
**Question 1**: What is the convergence threshold in this implementation?

Your answer: 1.0e-8f。

**Question 2**: Why is it important to check convergence rather than always running max_iterations?

Your answer: 收敛到一定范围停止迭代可以不进行不必要的迭代，提升性能表现。

**Question 3**: How does the double-buffering (swapping prev and new centroids) help?

Your answer: 算法需要交换数据以计算dx、dy，交换指针可以在交换数据的同时不进行内存拷贝。