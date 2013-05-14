#include <stdio.h>

volatile void func()
{
	printf("func called\n");
}

int main()
{
	func();
	printf("func returned\n");
	return 0;
}
