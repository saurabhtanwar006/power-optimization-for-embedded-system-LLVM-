#include <stdio.h>
#include <stdlib.h>
const int N = 1000;
int A[1000][1000], B[1000][1000], C[1000][1000];
int main()
{
	
	int i, j, k, a = 100, b = 200;
	for (i=0; i<N; i++)
	{
		for (j=0; j<N; j++)
		{
			A[i][j] = rand()%50;
			B[i][j] = rand()%50;
			//printf("%d %d\n",A[i][j], B[i][j]);
		}
	}
	for(i=0;i<N;i++)
	{
		for(j=0;j<N;j++)
		{
			C[i][j]=0;
			for(k=0;k<N;k++)
			{
				C[i][j]=C[i][j]+(A[i][k]+B[k][j]);
				
			}
		}
	}
	return 0;
}
