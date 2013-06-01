#include <stdio.h>

int a = 10, b;

int main()
{
	asm("movl %1, %%eax;	\n\t"
		"movl %%eax, %0	\n\t"
		:"=r"(b)
		:"r"(a)
		:"%eax"
	   );
	asm(
		"int $1;		\n\t"
		"leal (%0, %0, 4), %0;\n\t"
		:"=r"(b)
		:"0"(b)
	   );
	printf("b = %d\n", b);
	return 0;
}