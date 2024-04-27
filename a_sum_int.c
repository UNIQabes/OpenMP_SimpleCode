#include <omp.h>
#include <stdio.h>

double second();

#define SIZE 1000000

int main()
{

    int array[SIZE];

    int i = 0;
#pragma omp parallel private(i)
    {

#pragma omp for
        for (i = 0; i < SIZE; i++)
        {
            array[i] = 10;
        }
    }

    int s = 0;

    double start = second();
#pragma omp parallel
    {

#pragma omp for private(i) reduction(+ : s)
        for (i = 0; i < SIZE; i++)
        {
            s += array[i];
        }
    }

    double end = second();
    // printf("result:%d\n", s);
    // printf("time:%lf\n", end - start);
    printf("%lf", end - start);
    return 1;
}