#include <omp.h>
#include <stdio.h>
#include <math.h>

double second();

#define SIZE 100000

int main()
{
    int i = 0;
    double s = 0;

    double start = second();
#pragma omp parallel
    {

#pragma omp for private(i) reduction(+ : s)
        for (i = 1; i < SIZE; i++)
        {
            s += 1.0 / i * sin(1.0 / i);
        }
    }

    double end = second();
    printf("result:%f\n", s);
    printf("time:%lf\n", end - start);
    return 1;
}