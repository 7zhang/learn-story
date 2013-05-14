#include <stdio.h>
#include <stdarg.h>

int sum(char n,...)
{
	int i,sum=0;
	va_list vl;
	va_start(vl,n);
	for(i=0;i<n;i++)
		sum+=va_arg(vl,int);
	va_end(vl);
	return sum;
}
int main()
{
	int x;
	x=sum(10,1,2,3,5,5,4,3,2,3,7);
	printf("sum=%d\n",x);
	return 0;
}
