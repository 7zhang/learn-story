#include "loadstl.h"
#include <stdio.h>
#include <stdlib.h>
/*  85738 */
int main(int argc, char *argv[])
{
	stldata mystldata;
	if(loadstl(argv[1], &mystldata) !=0)
	{
		printf("loadstl error\n");
		return 0;
	}
	printf("stlmodel: %s \n", mystldata.modelname);
	printf("there are %d triangles in the model\nthey are\n", mystldata.num);
	triangle *iter = mystldata.ptriangle;
	for(int i = 0; i < mystldata.num; i++)
	{
		printf("triangle %d:\nnormalvector: x= %f, y= %f, z= %f\n", \
				i+1, iter->normalvector.x, iter->normalvector.y, iter->normalvector.z);
		printf("vertex1: x=%f, y= %f, z= %f , vertex2: x=%f, y= %f, z= %f , vertex3: x=%f, y= %f, z= %f \n",\
			       iter->vertex1.x, iter->vertex1.y, iter->vertex1.z, iter->vertex2.x, iter->vertex2.y, iter->vertex2.z, \
	       		 	iter->vertex3.x, iter->vertex3.y, iter->vertex3.z);
		iter++;
	}
	free(mystldata.ptriangle);
	return 0;
}

