#include "trianglecollisiondetection.h"

#include <stdio.h>

int main(void)
{
	triangle t1 = {{0.0, 0.0, 1}, {0.0, -1, 0.0}, {1, 0.0, 0.0}, {0.0, 1, 0.0}};
	triangle t2 = {{0.0, 0.0, 1}, {0.0, 0.0, 1}, {1, 0.0, 1}, {0.0, 1, 1}};
	triangle t3 = {{0.0, 1, 0.0}, {0.0, 0.0, 1}, {5, 0.0, 0.0}, {0.0, 0.0, 5}};
	if(trianglecollisiondetection(t1, t3))
		printf("collision detected\n");
	else
		printf("no collision\n");
	return 0;
}
