#include <stdio.h>

class A
{
	public:
		virtual void fun(){printf("fun\n");}
		virtual void fun1(){printf("fun1\n");}
		int i;
		int j;
};
class B: public A
{
	public:
		void fun(){printf("fun B\n");}
};
class C:public B
{
	public:
		int k;
};



int main()
{
	A a;
	C c;
}
