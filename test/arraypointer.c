#include <stdio.h>

int main()
{
	int a[5]={1,2,3,4,5};
	int b[5];
	int *ptr1=(int*)(&a+1);
	int (*ptr2)[5]=(&a+1);
	int *ptr3=a;
	*ptr1=1;
	ptr2=&b;
	*ptr3=3;
	return 0;
}
