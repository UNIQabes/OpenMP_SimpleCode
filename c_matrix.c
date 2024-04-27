#include <string.h>
#include <stdio.h>

#define M 100
#define K 90
#define N 80

double second();

int main()
{
    float mat1[M][K];
    // float mat2[K][N];
    float mat2_transe[N][K];

    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < K; j++)
        {
            mat1[i][j] = 1;
        }
    }
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < K; j++)
        {
            mat2_transe[i][j] = 1;
        }
    }

    float result[M][N];
    int m = 0;
    int n = 0;
    int k = 0;

    float s = 0;

    double start = second();

#pragma omp parallel for private(m)
    //  result[m](行ベクトル)を求める    mat1[m] mat2[0~K-1]が必要
    for (m = 0; m < M; m++)
    {
#pragma omp parallel for private(n)
        // result[m][n]を求める    mat1[m][0~K-1]*mat2[0~K-1][n]の総和
        for (n = 0; n < N; n++)
        {
            s = 0;
#pragma omp parallel for private(k) reduction(+ : s)
            for (k = 0; k < K; k++)
            {
                s += mat1[m][k] * mat2_transe[n][k];
            }
            result[m][n] = s;
        }
    }
    double end = second();
    /*
    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < N; j++)
        {
            printf(" %08.3f ", result[i][j]);
        }
        printf("\n");
    }
    */
    // printf("time:%lf\n", end - start);
    printf("%lf", end - start);
}