#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <time.h>
int main()
{
	freopen("Matrix_Ofast.txt","w",stdout);
	int n;
	for (n=0; n<=800; n=n+20)
	{
		int A[n][n], B[n][n], C[n][n];
		int i, j, k;
		for (i=0; i<n; i++)
		{
			for (j=0; j<n; j++)
			{
				A[i][j] = rand()%101;
				B[i][j] = rand()%101;
			}
		}
		double time = 0.0;
		clock_t start, end;
		start = clock();
		for(i=0;i<n;i++)
		{
			for(j=0;j<n;j++)
			{
				C[i][j]=0;
				for(k=0;k<n;k++)
				{
					C[i][j]=C[i][j]+A[i][k]*B[k][j];
				}
			}
		}
		end=clock();
		time = (double) (end-start)/CLOCKS_PER_SEC;
		printf("%d, %lf\n",n,time);

	}
	return 0;
}



