#include <stdio.h>

class A{
	public:
		int& operator[](int i);
		A(){}
	private:
		int aa[10];
};
int& A::operator[](int i)
{
	return aa[i];
}
int main()
{
	A test;
	test[3]=3;
	printf("test[3]=%d\n",test[3]);
	return 0;
}

