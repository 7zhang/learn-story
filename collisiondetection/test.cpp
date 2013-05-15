#include "loadstl.h"
#include "trianglecollisiondetection.h"

#include <stdio.h>

int main(int argc, char** argv)
{
	stldata newgun;
	stldata part;
	if(loadstl(argv[1], &newgun) != 0)
	{
		printf("load newgun stl error\n");
	}
	if(loadstl(argv[2], &part) != 0)
	{
		printf("load part stl error!\n");
	}

	printf("stlmodel1: %s, %d triangles\n", newgun.modelname, newgun.num);
	printf("stlmodel2: %s, %d tirangles\n", part.modelname, part.num);
	printf("calculating collision...\n");
	
	long number = 0;	
	for(int i = 0; i < newgun.num; i++)
		for(int j = 0; j < part.num; j++)
			if(trianglecollisiondetection(newgun.ptriangle[i], part.ptriangle[j]))
					number++;
	printf("there are %ld potential collision triangle\n", number);
	printf("the ratio is %f\n", 1.0 * number/newgun.num /part.num);
	free(newgun.ptriangle);
	free(part.ptriangle);
	return 0;
}
