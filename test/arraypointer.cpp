#include <iostream>

using namespace std;

int main()
{
	int a[]={1, 2, 3, 4, 5};
	int (&b)[5]=a;
	cout<<"a="<<sizeof(a)<<endl;
	cout<<"*a="<<sizeof(*a)<<endl;
	cout<<"&a[0]="<<sizeof(&a[0])<<endl;
	cout<<"a="<<sizeof(a)<<endl;
	cout<<"&a="<<sizeof(&a)<<endl;
	cout<<"b="<<sizeof(b)<<endl;
	cout<<"*((int*)(&a+1)-1="<<*((int*)(&a+1)-1)<<endl;
	return 0;
}
