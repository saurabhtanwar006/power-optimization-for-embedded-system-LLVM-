#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <time.h>
int main(int argc, char *argv[])
{
	freopen(argv[1],"w",stdout);
	int n;
	for (n=500; n<=1000; n=n+50)
	{
		float A[n];
		int i, j;
		for (i=0; i<n; i++)
			for (j=0; j<n; j++)
				//A[i]= (float)((rand()%100000001)/100000.0);
				A[i]=(float)rand()/(float)(RAND_MAX/1000);
		double time = 0.0;
//		for (i=0; i<n; i++)
//			printf("%.2f ",A[i]);
//		printf("\n");
		clock_t start, end;
		start = clock();
		for(i=0;i<n;i++)
		{
			for(j=0;j<n-i;j++)
			{
				if (A[j]>A[j+1])
				{
					float temp = A[j];
					A[j]=A[j+1];
					A[j+1]=temp;
				}
			}
		}
//		for (i=0; i<n; i++)
//			printf("%.2f ",A[i]);
//		printf("\n");
		end=clock();
		time = (double) (end-start)/CLOCKS_PER_SEC;
		printf("%d, %lf\n",n,time*1000);

	}
	return 0;
}



