#include <iostream>
#include <stdlib.h>
#include <sys/time.h> 

using namespace std;

const int N = 1024;  // matrix size
const int count = 100;

double a[N], recursion_sum[N], loop_sum[N];

void clear(int n)
{
    for (int i = 0; i < n; i++)
    {
        recursion_sum[i] = a[i];
        loop_sum[i] = a[i];
    }
}

void init(int n)  // generate a N∗N matrix
{
    for (int i = 0; i < n; i++)
    {
        a[i] = i;
    }
    clear(n);
}

double trivial(int n)
{
    double sum = 0; 

    for (int i = 0; i < n; i++)
    {
        sum += a[i];
    }

    return sum;
}

double multilink(int n)
{
    double sum1 = 0, sum2 = 0; 

    for (int i = 0; i < n; i += 2)
    {
        sum1 += a[i];
        sum2 += a[i + 1];
    }

    return (sum1 + sum2);
}

void recursion(int n)
{
    if (n == 1)
        return;
    else
    {
        for (int i = 0; i < n / 2; i++)
        {
            recursion_sum[i] += recursion_sum[n - i - 1];
            n = n / 2;
            recursion(n);
        }
    }
}

void loop(int n)
{
    for (int m = n; m > 1; m /= 2)
        for (int i = 0; i < m / 2; i++)
            loop_sum[i] = loop_sum[i * 2] + loop_sum[i * 2 + 1];
}

int main(void)
{
    struct timeval head, tail;
    double time1, time2;
    init(N);

    for (int j = 4; j <= N; j *= 2)
    {
        cout << "Size: " << j << endl;
        time1 = 0, time2 = 0;

        gettimeofday(&head, NULL);

        for (int i = 0; i < ::count; i++)
            trivial(j);
            
        gettimeofday(&tail, NULL);
        cout << "Average time per trivial operation: " << ((tail.tv_sec - head.tv_sec) * 1000.0 + (tail.tv_usec - head.tv_usec) / 1000.0) / ::count << " ms" << endl;

        gettimeofday(&head, NULL);

        for (int i = 0; i < ::count; i++)
            multilink(j);
            
        gettimeofday(&tail, NULL);
        cout << "Average time per multilink operation: " << ((tail.tv_sec - head.tv_sec) * 1000.0 + (tail.tv_usec - head.tv_usec) / 1000.0) / ::count << " ms" << endl;

        for (int i = 0; i < ::count; i++)
        {
            clear(j);
            gettimeofday(&head, NULL);
            recursion(j);
            gettimeofday(&tail, NULL);
            time1 += (tail.tv_sec - head.tv_sec) * 1000.0 + (tail.tv_usec - head.tv_usec) / 1000.0;
        }

        cout << "Average time per recursion operation: " << time1 / ::count << " ms" << endl;

        gettimeofday(&head, NULL);

        for (int i = 0; i < ::count; i++)
        {
            clear(j);
            gettimeofday(&head, NULL);
            loop(j);
            gettimeofday(&tail, NULL);
            time2 += (tail.tv_sec - head.tv_sec) * 1000.0 + (tail.tv_usec - head.tv_usec) / 1000.0;
        }
            
        gettimeofday(&tail, NULL);
        cout << "Average time per loop operation: " << time2 / ::count << " ms" << endl;
    }

    return 0;
}
