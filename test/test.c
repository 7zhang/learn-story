#include <stdio.h>

int j=3;
int*k=&j;
int * square()
{
	int temp=*k;
	temp++;
	return &temp;
}
int * square1()
{
	short temp=100;
	return &temp;
}

int main()
{
	int* i;
	i= square();
	printf("%d\n",*i);
	int* j=square1();
	printf("%d\n",*i);
}
