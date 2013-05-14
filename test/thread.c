#include <stdio.h>
#include <pthread.h>

int thread(void)
{
	int i;
	for(i=0;i<1000000;i++)
		printf("This is a pthread.\n");
	return 1;
}

int main()
{
	pthread_t id;
	int i, ret;
	ret=pthread_create(&id, NULL, (void*)thread, NULL);
	if(ret!=0){
	printf("Create pthread error\n");
	exit(1);
	}
	for(i=0;i<1000000;i++)
		printf("This is the main process\n");
	int *r=&ret;
	pthread_join(id,NULL);
	printf("pthread return successfully");
	return 0;
}


http://fanqiang.chinaunix.net/a4/b8/20010811/0905001105.html
