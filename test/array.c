#include <stdio.h>

int main()
{
	long a[10]={1,2,3,4,5,6,7,8,9,10};
	short*p=a;
	p[3]=4;
	return 0;
}
