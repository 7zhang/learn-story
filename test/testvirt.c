#include <stdio.h>

class A
{
	public:
		void add(int i)
		{
			int l=i;
			printf("A virtual%d\n",l);
		}
		int B;
};

int main()
{
	int b=3;
	A a;
	int c=4;
	a.add(c);
	return 0;
}
