#include <iostream>
#include <vector>
#include <string>
using namespace std;
int main()
{
	vector<string> rq;
	rq.push_back("sadf");
	rq.push_back("dddd");
	vector<string>::iterator iter=rq.begin();
	cout<<*iter<<*(iter+1)<<endl;
	rq.insert(rq.begin(),"werwer");
	rq.insert(rq.begin(),"next");
	for(int i=0;i<20;i++)
		rq.insert(rq.begin(),"sfsdfsfsafas");
	for(iter=rq.begin();iter<rq.end();iter++)
		cout<<*iter<<endl;
	return 0;

}
	
