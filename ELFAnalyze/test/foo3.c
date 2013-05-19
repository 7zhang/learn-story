#include <stdio.h>

void f(void);

int x;
int y = 15212;

int main()
{
	f();
	printf("x = 0x%x, y = 0x%x \n", x , y);
	return 0;
}
