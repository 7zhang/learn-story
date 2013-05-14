#include <stdio.h>
#include <iostream>

class A
{
	public:
		virtual void add(){printf("A virtual\n"); }
};
class B: public A
{
	public:
	void	add(){printf("B virtual\n");}
};

int main(void)
{
	A a;
	B b;
	A* pa = &a;
	pa->add();
	pa = &b;
	pa->add();
	pa->A::add();
 return 0;
}
