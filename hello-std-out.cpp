#include <stdio.h>
#include <unistd.h>

int main()
{
	while(1)
	{
		fprintf(stdout, "hello-std-out");
		fprintf(stderr, "hello-std-err");
	}
	return 0;
}
