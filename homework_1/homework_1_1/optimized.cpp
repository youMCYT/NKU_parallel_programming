#include <iostream>
#include <stdlib.h>
#include <sys/time.h> 

using namespace std;

const int N = 1024;  // matrix size
const int count = 100;

double a[N], b[N][N], optimized_sum[N];

void init(int n)  // generate a N∗N matrix
{
    for (int i = 0; i < n; i++)
    {
        a[i] = n - i;
        for (int j = 0; j < n; j++)
            b[i][j] = i + j;
    }
}

void optimized(int n)
{
    for (int i = 0; i < n; i++)
        optimized_sum[i] = 0.0;
    for (int j = 0; j < n; j++)
        for (int i = 0; i < n; i++)
            optimized_sum[i] += b[j][i] * a[j];
}

int main(void)
{
    struct timeval head, tail;
    init(N);

    for (int j = 4; j <= N; j *= 2)
    {
        cout << "Size: " << j << endl;
        gettimeofday(&head, NULL);

        for (int i = 0; i < ::count; i++)
            optimized(j);
            
        gettimeofday(&tail, NULL);
        cout << "Average time per trivial operation: " << ((tail.tv_sec - head.tv_sec) * 1000.0 + (tail.tv_usec - head.tv_usec) / 1000.0) / ::count << " ms" << endl;
    }

    return 0;
}
