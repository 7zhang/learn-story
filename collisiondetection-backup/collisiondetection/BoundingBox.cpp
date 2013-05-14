// BoundingBox.cpp: implementation of the BoundingBox class.
//
//////////////////////////////////////////////////////////////////////
#include "BoundingBox.h"
#include <fstream>
#include <algorithm>
#include <cmath>
#include <float.h>

//�����Ƚϴ�С������С����
//----------------------------------------------------------------------------
template<typename T>
T& larger(const T& a, const T& b)
{
	return a>b?a:b;
}

//----------------------------------------------------------------------------
template<typename T>
T& smaller(const T& a, const T& b)
{
	return a<b?a:b;
}

/////////////////////////////////////////
//class InterferenceDetectable
/////////////////////////////////////////
//----------------------------------------------------------------------------
InterferenceDetectable::InterferenceDetectable()
{
	
}
//----------------------------------------------------------------------------
InterferenceDetectable::~InterferenceDetectable()
{
	
}

/////////////////////////////////////////
//class TrigonChip
/////////////////////////////////////////
//----------------------------------------------------------------------------
TrigonChip::TrigonChip()
{
}

//----------------------------------------------------------------------------
TrigonChip::TrigonChip(const Point3D& v0,const Point3D& v1,const Point3D& v2,const Vector3D& nor)
{
	vex[0] = v0;
	vex[1] = v1;
	vex[2] = v2;
	normal = nor;
}

//----------------------------------------------------------------------------
TrigonChip::~TrigonChip()
{
}

//----------------------------------------------------------------------------
Point3D TrigonChip::getCenter()const
{
	Point3D res;
	res.x = (vex[0].x + vex[1].x + vex[2].x)/3;
	res.y = (vex[0].y + vex[1].y + vex[2].y)/3;
	res.z = (vex[0].z + vex[1].z + vex[2].z)/3;
	return res;
}

//----------------------------------------------------------------------------
double TrigonChip::getArea()const
{
	Vector3D a = vex[1] - vex[0];
	Vector3D b = vex[2] - vex[1];
	double area;
	Vector3D c = a*b;
	area = c.get_length()/2.0;
	return area;
}

//----------------------------------------------------------------------------
bool TrigonChip::isIntersectedWith(const TrigonChip& other)const
{
	Point3D U = vex[0];
	Point3D V = vex[1];
	Point3D W = vex[2];
	Point3D A = other.vex[0];
	Point3D B = other.vex[1];
	Point3D C = other.vex[2];
	
	Vector3D AU = U - A;
	Vector3D AV = V - A;
	Vector3D AW = W - A;
	double su = AU^other.normal;
	double sv = AV^other.normal;
	double sw = AW^other.normal;

	////////////////////////////
	//�ж�������1��������2����ƽ���һ��
	if ( (su > 0 && sv > 0 && sw > 0) || (su < 0 && sv < 0 && sw < 0) )
	{//ͬʱΪ���򸺣�������ͬһ�࣬˵�����ཻ���ཻ���Խ���
		return false;
	}
	//ȫ��Ϊ0�����������ι���
	//�ж϶�ά�ռ������������ε��������Ƿ����ཻ�����ཻ�򷵻�true����֮����false
	else if ( isZero(su) && isZero(sv)&& isZero(sw) )
	{
		return isIntersectedWith2D(other);
	}
	
	Vector3D UA = A - U;
	Vector3D UB = B - U;
	Vector3D UC = C - U;
	double sa = UA^normal;
	double sb = UB^normal;
	double sc = UC^normal;
	
	//�ж�������2��������1����ƽ���һ��
	if ( (sa > 0 && sb > 0 && sc > 0) || (sa < 0 && sb < 0 && sc < 0) )
	{//ͬʱΪ���򸺣�������ͬһ�࣬˵�����ཻ���ཻ���Խ���
		return false;
	}

	//��������������ƽ���ཻ��������һ��P�����ߵķ���DΪ���������η������Ĳ��
	double s1 = normal^(U-Point3D(0.0,0.0,0.0));
	double s2 = other.normal^(A-Point3D(0.0,0.0,0.0));
	double n1n2 = normal^other.normal;
	double a = (s2*n1n2-s1)/(n1n2*n1n2-1);
	double b = (s1*n1n2-s2)/(n1n2*n1n2-1);
	Vector3D OP = a*normal+b*other.normal;
	Point3D P = Point3D(0.0,0.0,0.0)+OP;
	Vector3D D = normal*other.normal;

	//����L��P+tD����������������뽻�ߵĽ����tֵ����t0,t1,t2,t3
	Vector3D UV = V-U;
	Vector3D VW = W-V;
	Vector3D WU = U-W;
	Vector3D AB = B-A;
	Vector3D BC = C-B;
	Vector3D CA = A-C;
	double t0,t1,t2,t3;
	if (su*sv<0 && su*sw<0 )//1.˵����U��V,U��W�ֲ���������ABC�����࣬��L���н��㣬���ڹ��棬ֻ����Ԫһ�η��̼���
	{
		double deta = UV.dx*D.dy-UV.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t0 = (UV.dx*(U.y-P.y)-UV.dy*(U.x-P.x))/deta;
		else
		{
			deta = UV.dy*D.dz-UV.dz*D.dy;
			if(!isZero(deta))
				t0 = (UV.dy*(U.z-P.z)-UV.dz*(U.y-P.y))/deta;
			else
				t0 = (UV.dx*(U.z-P.z)-UV.dz*(U.x-P.x))/(UV.dx*D.dz-UV.dz*D.dx);
		}

		deta = WU.dx*D.dy-WU.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t1 = (WU.dx*(W.y-P.y)-WU.dy*(W.x-P.x))/deta;
		else
		{
			deta = WU.dy*D.dz-WU.dz*D.dy;
			if(!isZero(deta))
				t1 = (WU.dy*(W.z-P.z)-WU.dz*(W.y-P.y))/deta;
			else
				t1 = (WU.dx*(W.z-P.z)-WU.dz*(W.x-P.x))/(WU.dx*D.dz-WU.dz*D.dx);
		}
	}
	else if (su*sv<0 && sw*sv<0 )//2
	{
		double deta = UV.dx*D.dy-UV.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t0 = (UV.dx*(U.y-P.y)-UV.dy*(U.x-P.x))/deta;
		else
		{
			deta = UV.dy*D.dz-UV.dz*D.dy;
			if(!isZero(deta))
				t0 = (UV.dy*(U.z-P.z)-UV.dz*(U.y-P.y))/deta;
			else
				t0 = (UV.dx*(U.z-P.z)-UV.dz*(U.x-P.x))/(UV.dx*D.dz-UV.dz*D.dx);
		}
		
		deta = VW.dx*D.dy-VW.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t1 = (VW.dx*(V.y-P.y)-VW.dy*(V.x-P.x))/deta;
		else
		{
			deta = VW.dy*D.dz-VW.dz*D.dy;
			if(!isZero(deta))
				t1 = (VW.dy*(V.z-P.z)-VW.dz*(V.y-P.y))/deta;
			else
				t1 = (VW.dx*(V.z-P.z)-VW.dz*(V.x-P.x))/(VW.dx*D.dz-VW.dz*D.dx);
		}
	}
	else if (sw*sv<0 && su*sw<0 )//3
	{
		double deta = WU.dx*D.dy-WU.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t0 = (WU.dx*(W.y-P.y)-WU.dy*(W.x-P.x))/deta;
		else
		{
			deta = WU.dy*D.dz-WU.dz*D.dy;
			if(!isZero(deta))
				t0 = (WU.dy*(W.z-P.z)-WU.dz*(W.y-P.y))/deta;
			else
				t0 = (WU.dx*(W.z-P.z)-WU.dz*(W.x-P.x))/(WU.dx*D.dz-WU.dz*D.dx);
		}
		
		deta = VW.dx*D.dy-VW.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t1 = (VW.dx*(V.y-P.y)-VW.dy*(V.x-P.x))/deta;
		else
		{
			deta = VW.dy*D.dz-VW.dz*D.dy;
			if(!isZero(deta))
				t1 = (VW.dy*(V.z-P.z)-VW.dz*(V.y-P.y))/deta;
			else
				t1 = (VW.dx*(V.z-P.z)-VW.dz*(V.x-P.x))/(VW.dx*D.dz-VW.dz*D.dx);
		}
	}
	if (t0 > t1)
		swap(t0,t1);

	if (sa*sb<0 && sb*sc<0 )//4˵����A��B,B��C�ֲ���������UVW�����࣬��L�н���
	{
		double deta = BC.dx*D.dy-BC.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t2 = (BC.dx*(B.y-P.y)-BC.dy*(B.x-P.x))/deta;
		else
		{
			deta = BC.dy*D.dz-BC.dz*D.dy;
			if(!isZero(deta))
				t2 = (BC.dy*(B.z-P.z)-BC.dz*(B.y-P.y))/deta;
			else
				t2 = (BC.dx*(B.z-P.z)-BC.dz*(B.x-P.x))/(BC.dx*D.dz-BC.dz*D.dx);
		}
		
		deta = AB.dx*D.dy-AB.dy*D.dx;
		if(!isZero(deta))
			t3 = (AB.dx*(A.y-P.y)-AB.dy*(A.x-P.x))/deta;
		else
		{
			deta = AB.dy*D.dz-AB.dz*D.dy;
			if(!isZero(deta))
				t3 = (AB.dy*(A.z-P.z)-AB.dz*(A.y-P.y))/deta;
			else
				t3 = (AB.dx*(A.z-P.z)-AB.dz*(A.x-P.x))/(AB.dx*D.dz-AB.dz*D.dx);
		}
	}
	else if (sa*sb<0 && sa*sc<0 )//5
	{
		double deta = CA.dx*D.dy-CA.dy*D.dx;
		if(!isZero(deta))
			t2 = (CA.dx*(C.y-P.y)-CA.dy*(C.x-P.x))/deta;
		else
		{
			deta = CA.dy*D.dz-CA.dz*D.dy;
			if(!isZero(deta))
				t2 = (CA.dy*(C.z-P.z)-CA.dz*(C.y-P.y))/deta;
			else
				t2 = (CA.dx*(C.z-P.z)-CA.dz*(C.x-P.x))/(CA.dx*D.dz-CA.dz*D.dx);
		}
		
		deta = AB.dx*D.dy-AB.dy*D.dx;
		if(!isZero(deta))
			t3 = (AB.dx*(A.y-P.y)-AB.dy*(A.x-P.x))/deta;
		else
		{
			deta = AB.dy*D.dz-AB.dz*D.dy;
			if(!isZero(deta))
				t3 = (AB.dy*(A.z-P.z)-AB.dz*(A.y-P.y))/deta;
			else
				t3 = (AB.dx*(A.z-P.z)-AB.dz*(A.x-P.x))/(AB.dx*D.dz-AB.dz*D.dx);
		}
	}
	else if (sb*sc<0 && sa*sc<0 )//6
	{
		double deta = BC.dx*D.dy-BC.dy*D.dx;//�жϳ����Ƿ�Ϊ0
		if(!isZero(deta))
			t2 = (BC.dx*(B.y-P.y)-BC.dy*(B.x-P.x))/deta;
		else
		{
			deta = BC.dy*D.dz-BC.dz*D.dy;
			if(!isZero(deta))
				t2 = (BC.dy*(B.z-P.z)-BC.dz*(B.y-P.y))/deta;
			else
				t2 = (BC.dx*(B.z-P.z)-BC.dz*(B.x-P.x))/(BC.dx*D.dz-BC.dz*D.dx);
		}
		
		deta = CA.dx*D.dy-CA.dy*D.dx;
		if(!isZero(deta))
			t3 = (CA.dx*(C.y-P.y)-CA.dy*(C.x-P.x))/deta;
		else
		{
			deta = CA.dy*D.dz-CA.dz*D.dy;
			if(!isZero(deta))
				t3 = (CA.dy*(C.z-P.z)-CA.dz*(C.y-P.y))/deta;
			else
				t3 = (CA.dx*(C.z-P.z)-CA.dz*(C.x-P.x))/(CA.dx*D.dz-CA.dz*D.dx);
		}
	}
	if (t2 > t3)
		swap(t2,t3);

	if((t1<t2) || (t3<t0))
		return false;
	else
		return true;
}

//----------------------------------------------------------------------------
//���ж����������ε��������Ƿ����ཻ�����ཻ�򷵻�true����֮��һ��
//���ж��Ƿ��е����������ڣ�������˵�����ڰ������������true����֮����false
bool TrigonChip::isIntersectedWith2D(const TrigonChip& other)const
{
	if (isTwoLineIntersected(vex[0], vex[1], other.vex[0], other.vex[1]) ||
		isTwoLineIntersected(vex[0], vex[1], other.vex[1], other.vex[2]) ||
		isTwoLineIntersected(vex[0], vex[1], other.vex[0], other.vex[2]) ||
		isTwoLineIntersected(vex[0], vex[2], other.vex[0], other.vex[1]) ||
		isTwoLineIntersected(vex[0], vex[2], other.vex[1], other.vex[2]) ||
		isTwoLineIntersected(vex[0], vex[2], other.vex[0], other.vex[2]) ||
		isTwoLineIntersected(vex[2], vex[1], other.vex[0], other.vex[1]) ||
		isTwoLineIntersected(vex[2], vex[1], other.vex[1], other.vex[2]) ||
		isTwoLineIntersected(vex[2], vex[1], other.vex[0], other.vex[2]) )
		return true;
	if(isInTrigon(other.vex[0]) || isInTrigon(other.vex[1]) || isInTrigon(other.vex[2]) ||
		other.isInTrigon(vex[0]) || other.isInTrigon(vex[1]) || other.isInTrigon(vex[2]) )
		return true;
	return false;
}

//----------------------------------------------------------------------------
//����õ�������Ƭ����ƽ����,��������Ƭ�ڣ�������AU��AV��AW�����н����Ϊ360��
bool TrigonChip::isInTrigon(Point3D A) const
{
	Point3D U = vex[0];
	Point3D V = vex[1];
	Point3D W = vex[2];
	Vector3D AU = U - A;
	Vector3D AV = V - A;
	Vector3D AW = W - A;

	double temp = getAngleOfTwoVector(AU, AV)+getAngleOfTwoVector(AV,AW)+getAngleOfTwoVector(AW,AU);
	return ((temp-2*PI)<0.001)&&((temp-2*PI)>-0.001);
}

//----------------------------------------------------------------------------
//�����ĸ���ֱ�Ϊ�߶εĶ˵㣬x��y��z��Ϊ�����߶εķ����ᣬֻҪ��һ�����ϵ�ͶӰ���غϾ�˵�����ཻ
bool TrigonChip::isTwoLineIntersected(Point3D p1, Point3D p2, Point3D p3, Point3D p4) const
{
	double left1, right1, left2, right2;
	//x��
	if (p1.x < p2.x)
	{
		left1 = p1.x;
		right1 = p2.x;
	}
	else
	{
		left1 = p2.x;
		right1 = p1.x;
	}
	if (p3.x < p4.x)
	{
		left2 = p3.x;
		right2 = p4.x;
	}
	else
	{
		left2 = p4.x;
		right2 = p3.x;
	}
	if( (right1<left2) || (right2<left1) )
		return false;
	//y��
	if (p1.y < p2.y)
	{
		left1 = p1.y;
		right1 = p2.y;
	}
	else
	{
		left1 = p2.y;
		right1 = p1.y;
	}
	if (p3.y < p4.y)
	{
		left2 = p3.y;
		right2 = p4.y;
	}
	else
	{
		left2 = p4.y;
		right2 = p3.y;
	}
	if( (right1<left2) || (right2<left1) )
		return false;
	//z��
	if (p1.z < p2.z)
	{
		left1 = p1.z;
		right1 = p2.z;
	}
	else
	{
		left1 = p2.z;
		right1 = p1.z;
	}
	if (p3.z < p4.z)
	{
		left2 = p3.z;
		right2 = p4.z;
	}
	else
	{
		left2 = p4.z;
		right2 = p3.z;
	}
	if( (right1<left2) || (right2<left1) )
		return false;
	return true;
}

//----------------------------------------------------------------------------
//���ص�Ϊ����
double TrigonChip::getAngleOfTwoVector(Vector3D v1, Vector3D v2)const
{
	double cosx = (v1^v2)/(v1.get_length()*v2.get_length());
	return acos(cosx);
}

//----------------------------------------------------------------------------
//��Լ����UV�Ѿ��ڴ�����Ƭ������
//���ã��жϴ������Ƿ��߶ιᴩ
bool TrigonChip::isTrigonDrilledThrough( Point3D U, Point3D V ) const
{
	double u = 0.0;
	double v = 0.0;
	Point3D Va = vex[0];
	Point3D Vb = vex[1];
	Point3D Vc = vex[2];
	
	Vector3D d = V - U;
	ASSERT(!isZero(d.get_length()));
	d.unitize();
	
	double denominator = (d * (Vc - Va)) ^ (Va - Vb);
	ASSERT(denominator);
	u = ( (d * (Vc-Va)) ^ (U - Va) ) / denominator;
	v = ( ( (U - Va) * (Vb - Va) ) ^ d ) / denominator;
	
	if (0.0 <= u && u <= 1.0 && 0.0 <= v && v <= 1.0 && u + v <= 1.0)
	{
		return true;
	}
	return false;
}

//----------------------------------------------------------------------------
void TrigonChip::updateByTransWorldToCur(const TRANS& matrix)
{
	normal = matrix * normal;
	vex[0] = matrix * vex[0];
	vex[1] = matrix * vex[1];
	vex[2] = matrix * vex[2];
}

/////////////////////////////////////////
//class STLModel
/////////////////////////////////////////
//----------------------------------------------------------------------------
STLModel::STLModel() 
{

}

//----------------------------------------------------------------------------
STLModel::~STLModel()
{
}

//----------------------------------------------------------------------------
void STLModel::setMaxDepth(unsigned int depth)
{
	m_maxDepth = depth;
}

//----------------------------------------------------------------------------
void STLModel::setmaxTrigonNum(unsigned int trigonNum)
{
	m_maxTrigonNum = trigonNum;
}

//----------------------------------------------------------------------------
void STLModel::loadSTLFile(CString stlname)//�Զ����Ƶķ�ʽ����ȡstl�ļ�
{
	m_trigonChips.clear();

	std::ifstream fin;
	fin.open(stlname, std::ios::binary);
	if (!fin.is_open())
	{
		throw std::runtime_error("file open error");
		return;
	}
	
	//����ǰ80���ֽڣ���Ϊģ�͵�����
	char modelName[81] = {0};//��'\0'��β����������Ԥ��һ���ֽ�
	fin.read(modelName, 80);
	m_modelName = std::string(modelName);
	
	int trigonNum;
	//�����������4���ֽڣ���Ϊ����Ƭ�ĸ���
	fin.read(reinterpret_cast<char*>(&trigonNum), 4);
	
	//����ʽ��������Ƭ��50���ֽ�Ϊһ��
	for (int i = 0; i < trigonNum; ++i)
	{
		//50���ֽڵ����壺
		//3��4�ֽڸ���������������������Ƭ�ķ�����
		//3��4�ֽڸ�����������������1�����������
		//3��4�ֽڸ�����������������2�����������
		//3��4�ֽڸ�����������������3�����������
		//��������ֵ�ɺ���ת��Ϊ��
		//���2���ֽ���ʱû�ã������Ǵ�����ɫ
		TrigonChip trigonChip;
		float a, b, c;
		fin.read(reinterpret_cast<char*>(&a), 4);
		fin.read(reinterpret_cast<char*>(&b), 4);
		fin.read(reinterpret_cast<char*>(&c), 4);
		trigonChip.normal.dx = static_cast<double>(a);
		trigonChip.normal.dy = static_cast<double>(b);
		trigonChip.normal.dz = static_cast<double>(c);
		
		fin.read(reinterpret_cast<char*>(&a), 4);
		fin.read(reinterpret_cast<char*>(&b), 4);
		fin.read(reinterpret_cast<char*>(&c), 4);
		trigonChip.vex[0].x = static_cast<double>(a);
		trigonChip.vex[0].y = static_cast<double>(b);
		trigonChip.vex[0].z = static_cast<double>(c);
		
		fin.read(reinterpret_cast<char*>(&a), 4);
		fin.read(reinterpret_cast<char*>(&b), 4);
		fin.read(reinterpret_cast<char*>(&c), 4);
		trigonChip.vex[1].x = static_cast<double>(a);
		trigonChip.vex[1].y = static_cast<double>(b);
		trigonChip.vex[1].z = static_cast<double>(c);
		
		fin.read(reinterpret_cast<char*>(&a), 4);
		fin.read(reinterpret_cast<char*>(&b), 4);
		fin.read(reinterpret_cast<char*>(&c), 4);
		trigonChip.vex[2].x = static_cast<double>(a);
		trigonChip.vex[2].y = static_cast<double>(b);
		trigonChip.vex[2].z = static_cast<double>(c);
		
		char last[2];
		fin.read(last, 2);
		
		m_trigonChips.push_back(trigonChip);
	}
	fin.clear();
	fin.close();
}

//----------------------------------------------------------------------------
//������Ƭ����������ΰ�Χ��
InterferenceDetectable* STLModel::constructBoxTree()const
{
	InterferenceDetectable* res = NULL;
	
	recursivelyConstructBoxTree(res, m_trigonChips, 1);//��ǰ�����һ��
	return res;
}

//----------------------------------------------------------------------------
void STLModel::recursivelyConstructBoxTree(InterferenceDetectable* &node, const std::vector<TrigonChip>& chips, int curDeep)const
{
	//�����ж�chips�ǲ��ǿ��Խ��зָ�
	//�����ܽ��зָ�򹹽�һ�������Box����ֹ����
	//���ָܷ�򹹽������Box��Ҫ����νṹ
	AABB_Box box(chips);
	int n = chips.size();//�ܵ�����Ƭ����
	if (curDeep >= m_maxDepth || n < 2)//�����������˳�
	{
		//�����ٷ��ѣ�����һ��Box�ڵ�
// 		if (n>m_maxTrigonNum)
// 			node = new AABB_BoxFlock(box, chips);
// 		else
			node = new AABB_Box(box);
		return;
	}

	//�ж�box���ĸ�������γ�����̣���ȡ�������˳��
	std::vector<int> seq = box.getAxisLengthSeq();
	std::vector<Vector3D> seperatingAxisVec;
	for (std::vector<int>::iterator it = seq.begin(); it != seq.end(); ++it)
	{
		if ((*it) == 1)
		{
			Vector3D X(1.0,0.0,0.0);//X�ᷨ����
			seperatingAxisVec.push_back(X);
		}
		else if ((*it) == 2)
		{
			Vector3D Y(0.0,1.0,0.0);//X�ᷨ����
			seperatingAxisVec.push_back(Y);
		}
		else
		{
			Vector3D Z(0.0,0.0,1.0);//X�ᷨ����
			seperatingAxisVec.push_back(Z);
		}
	}

	//���γ������������ᣬ������Ƭ��ֳ����ݣ�ֻҪ��һ����������������������
	//�����������ᶼ�����㣬������Ѳ��ܲ��
	vector<TrigonChip> leftChips, rightChips;
	for (int i = 0; i < seperatingAxisVec.size(); ++i)
	{
		Vector3D seperatingAxis = seperatingAxisVec[i];
		leftChips.clear();
		rightChips.clear();
		
		for (int j = 0; j < chips.size(); ++j)
		{
			Vector3D m = chips[j].getCenter() - box.m_center;
			double dot = seperatingAxis^m;//�������
			if (dot < -0.001)
			{
				rightChips.push_back(chips[j]);
			}
			else
			{
				leftChips.push_back(chips[j]);
			}
		}
		//���leftChips��Ϊ�ջ���Ϊ����chip������,����һ��������
		if (leftChips.size() != 0 && leftChips.size() != n)
		{
			break;
		}
	}
	//��ʾ3�������ᶼδ������Ҫ��
	if (i == 3)
	{
		//�����ٷ��ѣ�����һ��Box�ڵ�
		if (n>m_maxTrigonNum)
			node = new AABB_BoxFlock(box, chips);
		else
			node = new AABB_Box(box);
	}
	else
	{
		//���ѳɹ�
		node = new AABB_BoxFlock(box);
		InterferenceDetectable* leftLink, *rightLink;
		recursivelyConstructBoxTree(leftLink, leftChips, curDeep+1);
		recursivelyConstructBoxTree(rightLink, rightChips, curDeep+1);
		(*static_cast<AABB_BoxFlock*>(node)).add(leftLink);
		(*static_cast<AABB_BoxFlock*>(node)).add(rightLink);
	}
}

InterferenceDetectable* STLModel::constructBoxTree2()const
{
	InterferenceDetectable* res = NULL;
	
	recursivelyConstructBoxTree2(res, m_trigonChips, 1);//��ǰ�����һ��
	return res;
}


void STLModel::recursivelyConstructBoxTree2(InterferenceDetectable* &node, const std::vector<TrigonChip>& chips, int curDeep)const
{
	//�����ж�chips�ǲ��ǿ��Խ��зָ�
	//�����ܽ��зָ�򹹽�һ�������Box����ֹ����
	//���ָܷ�򹹽������Box��Ҫ����νṹ
	OBB_Box box(chips);
	int n = chips.size();//�ܵ�����Ƭ��
	if (curDeep >= m_maxDepth || n < 2)//�����������˳�
	{
		node = new OBB_Box(box);
		return;
	}
	std::vector<TrigonChip> leftChips, rightChips;
	
	//�ж�box���ĸ�������γ������
	std::vector<int> seq = box.getAxixLengthSeq();
	std::vector<Vector3D> seperatingAxisVec;
	for (std::vector<int>::iterator it = seq.begin(); it != seq.end(); ++it)
	{
		if ((*it) == 1)
		{
			seperatingAxisVec.push_back(box.getI());
		}
		else if ((*it) == 2)
		{
			seperatingAxisVec.push_back(box.getJ());
		}
		else
		{
			seperatingAxisVec.push_back(box.getK());
		}
	}
	
	for (int i = 0; i < seperatingAxisVec.size(); ++i)
	{//���γ�������������
		Vector3D seperatingAxis = seperatingAxisVec[i];
		leftChips.clear();
		rightChips.clear();
		
		for (int j = 0; j < chips.size(); ++j)
		{
			Vector3D m = chips[j].getCenter() - box.getCenter();
			double dot = seperatingAxis^m;//�������
			if (dot < 0.0)
			{
				rightChips.push_back(chips[j]);
			}
			else
			{
				leftChips.push_back(chips[j]);
			}
		}
		
		//���leftChips��Ϊ�ջ���Ϊ����chip������,����һ��������
		if (leftChips.size() != 0 && leftChips.size() != n)
		{
			break;
		}
	}
	if (i == 3)//��ʾ3�������ᶼδ������Ҫ��
	{
		//�����ٷ��ѣ�����һ��Box�ڵ�
		node = new OBB_Box(box);
	}
	else
	{
		//���ѳɹ�
		node = new OBB_BoxFlock(box);
		InterferenceDetectable* leftLink, *rightLink;
		recursivelyConstructBoxTree2(leftLink, leftChips, curDeep+1);
		recursivelyConstructBoxTree2(rightLink, rightChips, curDeep+1);
		(*static_cast<OBB_BoxFlock*>(node)).add(leftLink);
		(*static_cast<OBB_BoxFlock*>(node)).add(rightLink);
	}
}

/////////////////////////////////////////
//class AABB_Box
/////////////////////////////////////////
//----------------------------------------------------------------------------
AABB_Box::AABB_Box() : m_pointVec(8),origin_pointVec(8)
{

}

//----------------------------------------------------------------------------
AABB_Box::~AABB_Box()
{

}

//----------------------------------------------------------------------------
AABB_Box::AABB_Box(const vector<TrigonChip>& trigonVec) : m_pointVec(8),origin_pointVec(8)
{
	m_trigons = trigonVec;
	unsigned int n = trigonVec.size();//����Ƭ����
	//�Ƚ�ÿһ����Ƭ�Ķ��㣬���xMin,xMax,yMin,yMax,zMin,zMax
	//�õ�һ������Ƭ�Ĳ�����ʼ������
	m_pointMin = trigonVec[0].vex[0];
	m_pointMax = trigonVec[0].vex[0];

	for (int i=0; i<n; i++)
	{
		//����Ƭ����������
		Point3D p1 = trigonVec[i].vex[0];
		Point3D p2 = trigonVec[i].vex[1];
		Point3D p3 = trigonVec[i].vex[2];

		double temp;
		temp = smaller<double>(p1.x, smaller<double>(p2.x,p3.x));
		if (temp < m_pointMin.x)
			m_pointMin.x = temp;
		temp = smaller<double>(p1.y, smaller<double>(p2.y,p3.y));
		if (temp < m_pointMin.y)
			m_pointMin.y = temp;
		temp = smaller<double>(p1.z, smaller<double>(p2.z,p3.z));
		if (temp < m_pointMin.z)
			m_pointMin.z = temp;

		temp = larger<double>(p1.x, larger<double>(p2.x,p3.x));
		if (temp > m_pointMax.x)
			m_pointMax.x = temp;
		temp = larger<double>(p1.y, larger<double>(p2.y,p3.y));
		if (temp > m_pointMax.y)
			m_pointMax.y = temp;
		temp = larger<double>(p1.z, larger<double>(p2.z,p3.z));
		if (temp > m_pointMax.z)
			m_pointMax.z = temp;
	}
	setPoint();
	setParam();
	//���ñ���¼
	origin_pointVec = m_pointVec;
	origin_trigons = trigonVec;
}

//----------------------------------------------------------------------------
void AABB_Box::setPoint()
{
	m_pointVec[0] = Point3D(m_pointMax.x,m_pointMax.y,m_pointMax.z);
	m_pointVec[1] = Point3D(m_pointMax.x,m_pointMax.y,m_pointMin.z);
	m_pointVec[2] = Point3D(m_pointMin.x,m_pointMax.y,m_pointMin.z);
	m_pointVec[3] = Point3D(m_pointMin.x,m_pointMax.y,m_pointMax.z);
	m_pointVec[4] = Point3D(m_pointMax.x,m_pointMin.y,m_pointMax.z);
	m_pointVec[5] = Point3D(m_pointMax.x,m_pointMin.y,m_pointMin.z);
	m_pointVec[6] = Point3D(m_pointMin.x,m_pointMin.y,m_pointMin.z);
	m_pointVec[7] = Point3D(m_pointMin.x,m_pointMin.y,m_pointMax.z);
}

//----------------------------------------------------------------------------
void AABB_Box::updateMinMax()
{
	//�õ�һ��������ʼ��
	m_pointMin = m_pointVec[0];
	m_pointMax = m_pointVec[0];
	for (int i=1; i<8; i++)
	{
		if (m_pointMin.x > m_pointVec[i].x)
			m_pointMin.x = m_pointVec[i].x;
		else if (m_pointMax.x < m_pointVec[i].x)
			m_pointMax.x = m_pointVec[i].x;

		if (m_pointMin.y > m_pointVec[i].y)
			m_pointMin.y = m_pointVec[i].y;
		else if (m_pointMax.y < m_pointVec[i].y)
			m_pointMax.y = m_pointVec[i].y;

		if (m_pointMin.z > m_pointVec[i].z)
			m_pointMin.z = m_pointVec[i].z;
		else if (m_pointMax.z < m_pointVec[i].z)
			m_pointMax.z = m_pointVec[i].z;
	}
}

//----------------------------------------------------------------------------
AABB_Box::AABB_Box(TrigonChip trigon): m_pointVec(8),origin_pointVec(8)
{
	m_trigons.push_back(trigon);
	//����Ƭ����������
	Point3D p1 = trigon.vex[0];
	Point3D p2 = trigon.vex[1];
	Point3D p3 = trigon.vex[2];

	m_pointMin.x = smaller<double>(p1.x, smaller<double>(p2.x,p3.x));
	m_pointMin.y = smaller<double>(p1.y, smaller<double>(p2.y,p3.y));
	m_pointMin.z = smaller<double>(p1.z, smaller<double>(p2.z,p3.z));
	m_pointMax.x = larger<double>(p1.x, larger<double>(p2.x,p3.x));
	m_pointMax.y = larger<double>(p1.y, larger<double>(p2.y,p3.y));
	m_pointMax.z = larger<double>(p1.z, larger<double>(p2.z,p3.z));
	
	setPoint();
	setParam();
	//���ñ���¼
	origin_pointVec = m_pointVec;
	origin_trigons = m_trigons;
}

//----------------------------------------------------------------------------
//����AABB��Χ�е����ԣ�ֻ��Ƚ�����������3�������᷽���ͶӰ�Ƿ��ص�
//ֻҪ��һ�����ϲ��ص���˵�����ཻ����3��������Ϊ��������ϵ�������ᡣ
bool AABB_Box::isIntersectedWith(const AABB_Box& other)const
{
	//���������Χ�����ĵ�֮�������
	Vector3D twoCenter(m_center.x-other.m_center.x, m_center.y-other.m_center.y, m_center.z-other.m_center.z);
	//�ֱ��ж�������Χ������������ϵX�ᡢY�ᡢZ���ϵ�ͶӰ�Ƿ��ص�
	//X��
	if (2*fabs(twoCenter.dx) > (m_a+other.m_a))
		return false;
	if (2*fabs(twoCenter.dy) > (m_b+other.m_b))
		return false;
	if (2*fabs(twoCenter.dz) > (m_c+other.m_c))
		return false;

	return true;
}

//----------------------------------------------------------------------------
CString AABB_Box::typeInfo()const
{
	return CString("AABB_Box");
}

//----------------------------------------------------------------------------
void AABB_Box::setParam()
{
	m_a = m_pointMax.x - m_pointMin.x;
	m_b = m_pointMax.y - m_pointMin.y;
	m_c = m_pointMax.z - m_pointMin.z;
	
	m_center.x = 0.5*(m_pointMax.x + m_pointMin.x);
	m_center.y = 0.5*(m_pointMax.y + m_pointMin.y);
	m_center.z = 0.5*(m_pointMax.z + m_pointMin.z);
}

vector<int> AABB_Box::getAxisLengthSeq()const
{
	std::vector<int> res;
	if (m_a >= m_b && m_b >= m_c)
	{
		res.push_back(1);
		res.push_back(2);
		res.push_back(3);
	}
	else if (m_a >= m_c && m_c >= m_b)
	{
		res.push_back(1);
		res.push_back(3);
		res.push_back(2);
	}
	else if (m_b > m_a && m_a >= m_c)
	{
		res.push_back(2);
		res.push_back(1);
		res.push_back(3);
	}
	else if (m_b >= m_c && m_c >= m_a)
	{
		res.push_back(2);
		res.push_back(3);
		res.push_back(1);
	}
	else if (m_c >= m_a && m_a >= m_b)
	{
		res.push_back(3);
		res.push_back(1);
		res.push_back(2);
	}
	else
	{
		res.push_back(3);
		res.push_back(2);
		res.push_back(1);
	}
	return res;
}

//----------------------------------------------------------------------------
void AABB_Box::updateByTransWorldToCur(const TRANS& matrix)
{
	m_transWorldToCur = matrix;
	//���³����嶥��
	for (int i=0; i<8; i++)
	{
		m_pointVec[i] = matrix*origin_pointVec[i];
	}

	updateMinMax();//���������С�������꣬�����ڶ�����������Ժ�
	setParam();//��Χ��������º󣬶�Ӧ�ĳ���ߺ����ĵ㶼��Ҫ����
}

//----------------------------------------------------------------------------
// void AABB_Box::updateTrigonsCoord()const
// {
// 	for (int i = 0; i < m_trigons.size(); ++i)
// 	{
// 		m_trigons[i] = origin_trigons[i];//����ԭʼֵ�����������
// 		m_trigons[i].updateByTransWorldToCur(m_transWorldToCur);
// 	}
// }

//----------------------------------------------------------------------------
bool AABB_Box::isIntersectedWith(InterferenceDetectable * other)const
{
	if ( other->typeInfo() == "AABB_Box" )
	{
		AABB_Box* otherBox = static_cast<AABB_Box*>(other);
		if(this->isIntersectedWith(*otherBox))//����֮�����
		{
			//return true;
			//����ཻ���жϺ����а�Χ������Ƭ�Ƿ��ཻ
			for (int i = 0; i < m_trigons.size(); ++i)
			{
				TrigonChip trigonOne = m_trigons[i];
				trigonOne.updateByTransWorldToCur(m_transWorldToCur);
				for (int j = 0; j < (otherBox->m_trigons).size(); ++j)
				{
					TrigonChip trigonTwo = (otherBox->m_trigons)[j];
					trigonTwo.updateByTransWorldToCur(otherBox->m_transWorldToCur);
					if (trigonOne.isIntersectedWith(trigonTwo))
					{
						return true;
					}
				}
			}
			return false;
		}
		else
			return false;
	}
	//other->typeInfo() == "AABB_BoxFlock"
	else
	{
		AABB_BoxFlock* otherTree = static_cast<AABB_BoxFlock*>(other);
		if (otherTree->hasTotalBox() && !this->isIntersectedWith(otherTree->getRootBox()))
		{
			return false;
		}
		else//����ཻ�ˣ���Ҫϸ��,������ӽڵ㣬�����ཻ���˳�
		{
			for (AABB_BoxFlock::SunIterator it = otherTree->begin(); it != otherTree->end(); ++it)
			{
				if (this->isIntersectedWith((*it)))
				{
					return true;
				}
			}
			return false;
		}
	}
}

/////////////////////////////////////////
//class AABB_BoxFlock
/////////////////////////////////////////
//----------------------------------------------------------------------------
AABB_BoxFlock::AABB_BoxFlock():m_isHasTotalBox(false)
{
	
}

//----------------------------------------------------------------------------
AABB_BoxFlock::AABB_BoxFlock(const AABB_Box& totalBox)
:m_isHasTotalBox(true), m_totalBox(totalBox)
{

}

//----------------------------------------------------------------------------
AABB_BoxFlock::AABB_BoxFlock(const AABB_Box& totalBox, const vector<TrigonChip>& trigonVec)
:m_isHasTotalBox(true), m_totalBox(totalBox)
{
	int n = trigonVec.size();
	for (int i=0; i<n; i++)
	{
		InterferenceDetectable* box = new AABB_Box(trigonVec[i]);
		m_leaves.push_back(box);
	}
}

//----------------------------------------------------------------------------
AABB_BoxFlock::~AABB_BoxFlock()
{
	//������뱣֤InterferenceDetectable������ʵ�������ڶ���
	//������������ϲ�Ľڵ�������������Զ������²�Ľڵ㣬�����Box���ֹͣ
	for (std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		delete (*it);
	}
}

//----------------------------------------------------------------------------
AABB_BoxFlock::SunIterator AABB_BoxFlock::begin()const
{
	return m_leaves.begin();
}

//----------------------------------------------------------------------------
AABB_BoxFlock::SunIterator AABB_BoxFlock::end()const
{
	return m_leaves.end();
}

//----------------------------------------------------------------------------
void AABB_BoxFlock::add(InterferenceDetectable * leaf)
{
	m_leaves.push_back(leaf);
}

//----------------------------------------------------------------------------
void AABB_BoxFlock::del(InterferenceDetectable * leaf)
{
	std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin();
	for (; it != m_leaves.end(); ++it)
	{
		if (leaf == *it)
		{
			m_leaves.erase(it);
			return;
		}
	}
}

//----------------------------------------------------------------------------
const AABB_Box& AABB_BoxFlock::getRootBox()const
{
	return m_totalBox;
}

//----------------------------------------------------------------------------
bool AABB_BoxFlock::isIntersectedWith(InterferenceDetectable * other)const
{
	if (m_isHasTotalBox && !m_totalBox.isIntersectedWith(other))//������other���ཻ�����ཻ��ֱ�ӷ���
	{
		return false;
	}
	//������������ж����ӽڵ��Ƿ������ཻ�������ཻ�������ֱ�ӷ��أ����е��ӽڵ㶼�ж���Ϻ�˵�������ཻ,�򷵻ز��ཻ
	for (std::vector<InterferenceDetectable*>::const_iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		if ((*it)->typeInfo() == "AABB_Box")//�����Ҷ�ӽڵ�
		{
			static_cast<AABB_Box*>(*it)->setLeaf(true);
		}
		if ((*it)->isIntersectedWith(other))
		{
			return true;
		}
	}
	return false;
}

//----------------------------------------------------------------------------
//Ϊ�������ײ����㷨Ч�ʣ�����������Χ�У�ֻ���������Χ�У����û�У��������һ���ӽڵ�
//��ûʵ�������Ĺ��ܣ�����ȫ������
void AABB_BoxFlock::updateByTransWorldToCur(const TRANS& matrix)
{
	m_totalBox.updateByTransWorldToCur(matrix);
	for (std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		(*it)->updateByTransWorldToCur(matrix);
	}
}

//----------------------------------------------------------------------------
CString AABB_BoxFlock::typeInfo()const
{
	return CString("AABB_BoxFlock");
}

/////////////////////////////////////////////////////////////
//Class OBB_Box 
/////////////////////////////////////////////////////////////
OBB_Box::OBB_Box()
{
	m_a = m_b = m_c = 0.0;
	m_isLeaf = false;
}

OBB_Box::~OBB_Box()
{

}

OBB_Box::OBB_Box(Point3D center, Vector3D i, Vector3D j, Vector3D k, double a, double b, double c)
    : m_center(center), m_i(i), m_j(j), m_k(k), m_a(a), m_b(b), m_c(c)
{
	//�������ڲ��ԵĹ��캯��
	m_isLeaf = false;
}

OBB_Box::OBB_Box(const std::vector<TrigonChip>& trigonVec)//��������ķѿռ���ʱ��
{
	m_trigons = trigonVec;
	double zero[9] = {0};
	Matrix3D C(zero);//Э�������
	Point3D u;//��ֵ��
	
	unsigned int n = trigonVec.size();
	unsigned int i = 0, j = 0, k = 0;
	//Ai��ʾΪ����Ƭi�������AΪ����Ƭ�����
	std::vector<double> A(n);
	double totalArea = 0.0;
	for (i = 0; i < n; ++i)
	{
		A[i] = trigonVec[i].getArea();
		//A[i] = 1;
		totalArea += A[i];
	}

	for (i = 0; i < n; ++i)
	{
		u.x += trigonVec[i].vex[0].x * (A[i]/(3*totalArea));
		u.y += trigonVec[i].vex[0].y * (A[i]/(3*totalArea));
		u.z += trigonVec[i].vex[0].z * (A[i]/(3*totalArea));
		u.x += trigonVec[i].vex[1].x * (A[i]/(3*totalArea));
		u.y += trigonVec[i].vex[1].y * (A[i]/(3*totalArea));
		u.z += trigonVec[i].vex[1].z * (A[i]/(3*totalArea));
		u.x += trigonVec[i].vex[2].x * (A[i]/(3*totalArea));
		u.y += trigonVec[i].vex[2].y * (A[i]/(3*totalArea));
		u.z += trigonVec[i].vex[2].z * (A[i]/(3*totalArea));
	}
	m_center = u;
	
	double p[3] = {0.0};
	double q[3] = {0.0};
	double r[3] = {0.0};
	double c[3] = {0.0};
	double ch[3] = {u.x, u.y, u.z};

	for (j = 0; j < 3; ++j)
	{
		for (k = 0; k < 3; ++k)
		{
			for (int i = 0; i < n; ++i)
			{
				p[0] = trigonVec[i].vex[0].x;
				p[1] = trigonVec[i].vex[0].y;
				p[2] = trigonVec[i].vex[0].z;
				q[0] = trigonVec[i].vex[1].x;
				q[1] = trigonVec[i].vex[1].y;
				q[2] = trigonVec[i].vex[1].z;
				r[0] = trigonVec[i].vex[2].x;
				r[1] = trigonVec[i].vex[2].y;
				r[2] = trigonVec[i].vex[2].z;
				//c[0] = trigonVec[i].getCenter().x;
				//c[1] = trigonVec[i].getCenter().y;
				//c[2] = trigonVec[i].getCenter().z;
				
				C.mem[j][k] += (A[i]/3/totalArea) * ((p[j]-ch[j]) * (p[k]-ch[k]) + (q[j]-ch[j])*(q[k]-ch[k]) + (r[j]-ch[j])*(r[k]-ch[k]));
			}
			//C.mem[j][k] -= ch[j]*ch[k];
		}
	}
///-------------------------------------------
	Matrix3D eigenvector_matrix;//������������
	double eigenvalue_array[3];//����ֵ����
	if (isZero(C.get_determinant()))
	{
		m_i = Vector3D(1.0, 0.0, 0.0);
		m_j = Vector3D(0.0, 1.0, 0.0);
		m_k = Vector3D(0.0, 0.0, 1.0);
	}
	else
	{
		Vector3D col1(C.mem[0][0], C.mem[1][0], C.mem[2][0]);
		Vector3D col2(C.mem[0][1], C.mem[1][1], C.mem[2][1]);
		Vector3D col3(C.mem[0][2], C.mem[1][2], C.mem[2][2]);
		if (col1.get_length()<1e-8 || col2.get_length()<1e-8 || col3.get_length()<1e-8)
		{
			m_i = Vector3D(1.0, 0.0, 0.0);
			m_j = Vector3D(0.0, 1.0, 0.0);
			m_k = Vector3D(0.0, 0.0, 1.0);
		}
		else
		{
			C.jacobbi(eigenvector_matrix, eigenvalue_array);
			m_i.dx = eigenvector_matrix.mem[0][0];
			m_i.dy = eigenvector_matrix.mem[1][0];
			m_i.dz = eigenvector_matrix.mem[2][0];
			m_j.dx = eigenvector_matrix.mem[0][1];
			m_j.dy = eigenvector_matrix.mem[1][1];
			m_j.dz = eigenvector_matrix.mem[2][1];
			m_k.dx = eigenvector_matrix.mem[0][2];
			m_k.dy = eigenvector_matrix.mem[1][2];
			m_k.dz = eigenvector_matrix.mem[2][2];
			if (isZero(m_i.get_length()) || isZero(m_j.get_length()) || isZero(m_k.get_length()))
			{
				m_i = Vector3D(1.0, 0.0, 0.0);
				m_j = Vector3D(0.0, 1.0, 0.0);
				m_k = Vector3D(0.0, 0.0, 1.0);
			}
			else
			{
				m_i.unitize();
				m_j.unitize();
				m_k.unitize();
			}
		}
		
	}

	//ȷ�������
	std::vector<double> aVec;
	std::vector<double> bVec;
	std::vector<double> cVec;
	for (i = 0; i < n; ++i)
	{
		//ÿ��trigon����������
		for (j = 0; j < 3; ++j)
		{
			Vector3D ov = trigonVec[i].vex[j] - m_center;
			aVec.push_back(ov ^ m_i);//�������
			bVec.push_back(ov ^ m_j);
			cVec.push_back(ov ^ m_k);
		}
	}

	double aMin, aMax, bMin, bMax, cMin, cMax;
	
	aMin = *std::min_element(aVec.begin(), aVec.end());
	aMax = *std::max_element(aVec.begin(), aVec.end());
	bMin = *std::min_element(bVec.begin(), bVec.end());
	bMax = *std::max_element(bVec.begin(), bVec.end());
	cMin = *std::min_element(cVec.begin(), cVec.end());
	cMax = *std::max_element(cVec.begin(), cVec.end());
	
	m_a = aMax - aMin;
	m_b = bMax - bMin;
	m_c = cMax - cMin;

	//�������ĵ�ѡ�������ƫ�ƣ�������е���
	m_center += (aMin+aMax)/2.0 * m_i;
	m_center += (bMin+bMax)/2.0 * m_j;
	m_center += (cMin+cMax)/2.0 * m_k;

	//���ñ���¼���ݣ���ԭʼ����
	origin_center = m_center;
	origin_i = m_i;
	origin_j = m_j;
	origin_k = m_k;
	origin_trigons = m_trigons;
}

std::vector<int> OBB_Box::getAxixLengthSeq()const
{
	std::vector<int> res;
	if (m_a >= m_b && m_b > m_c)
	{
		res.push_back(1);
		res.push_back(2);
		res.push_back(3);
	}
	else if (m_a >= m_c && m_c > m_b)
	{
		res.push_back(1);
		res.push_back(3);
		res.push_back(2);
	}
	else if (m_b > m_a && m_a > m_c)
	{
		res.push_back(2);
		res.push_back(1);
		res.push_back(3);
	}
	else if (m_b >= m_c && m_c > m_a)
	{
		res.push_back(2);
		res.push_back(3);
		res.push_back(1);
	}
	else if (m_c > m_a && m_a > m_b)
	{
		res.push_back(3);
		res.push_back(1);
		res.push_back(2);
	}
	else
	{
		res.push_back(3);
		res.push_back(2);
		res.push_back(1);
	}
	return res;
}

bool OBB_Box::isIntersectedWith(const OBB_Box& other)const
{
	//15��Ǳ�ڷ�����һһʵ�飬�����һ���ܹ�ʹ����Box�������˳�������false
	//15�������ܷ��룬���ж�Ϊ�����ཻ��������true
	//��15��������Ϊ��ÿ��box��3�������᣻������������Ǳ�������֮����໥��˵õ�����
	std::vector<Vector3D> separatingAxisVec;//��ŷ����������
	separatingAxisVec.push_back(m_i);
	separatingAxisVec.push_back(m_j);
	separatingAxisVec.push_back(m_k);
	separatingAxisVec.push_back(other.m_i);
	separatingAxisVec.push_back(other.m_j);
	separatingAxisVec.push_back(other.m_k);
	separatingAxisVec.push_back(m_i * other.m_i);
	separatingAxisVec.push_back(m_j * other.m_i);
	separatingAxisVec.push_back(m_k * other.m_i);
	separatingAxisVec.push_back(m_i * other.m_j);
	separatingAxisVec.push_back(m_j * other.m_j);
	separatingAxisVec.push_back(m_k * other.m_j);
	separatingAxisVec.push_back(m_i * other.m_k);
	separatingAxisVec.push_back(m_j * other.m_k);
	separatingAxisVec.push_back(m_k * other.m_k);

	double ra, rb;
	double tl;
	Vector3D L;//������
	Vector3D T;//���ĵ�����
	double a1 = m_a / 2.0;//��߳�
	double a2 = m_b / 2.0;
	double a3 = m_c / 2.0;
	double b1 = other.m_a / 2.0;
	double b2 = other.m_b / 2.0;
	double b3 = other.m_c / 2.0;

	for (int i = 0; i < 15; ++i)
	{
		L = separatingAxisVec[i];
		if (isZero(L.get_length()))
		{
			break;
		}
		L.unitize();
		T = other.m_center - m_center;

		//����ֵ
		ra = fabs((m_i*a1)^L) + fabs((m_j*a2)^L) + fabs((m_k*a3)^L);
		rb = fabs((other.m_i*b1)^L) + fabs((other.m_j*b2)^L) + fabs((other.m_k*b3)^L);
		tl = fabs(T ^ L);
		if (tl > ra + rb)//��ʾ����Ƿ����ᣬ�������ذ�A��B������
		{
			return false;
		}
	}
	return true;
}

bool OBB_Box::isIntersectedWith(InterferenceDetectable * other)const
{
	if (other->typeInfo() == "OBB_Box")
	{
		OBB_Box* otherBox = static_cast<OBB_Box*>(other);
		if(this->isIntersectedWith(*otherBox))//����֮�����
		{
			//����ཻ���жϺ����а�Χ������Ƭ�Ƿ��ཻ
			for (int i = 0; i < m_trigons.size(); ++i)
			{
				TrigonChip trigonOne = m_trigons[i];
				trigonOne.updateByTransWorldToCur(m_transWorldToCur);
				
				for (int j = 0; j < (otherBox->m_trigons).size(); ++j)
				{
					TrigonChip trigonTwo = (otherBox->m_trigons)[j];
					trigonTwo.updateByTransWorldToCur(otherBox->m_transWorldToCur);
					if (trigonOne.isIntersectedWith(trigonTwo))
					{
						return true;
					}
				}
			}
			return false;
		}
		else
		{
			return false;
		}
	}
	else//other->typeInfo() == "OBB_BoxFlock"
	{
		OBB_BoxFlock* otherTree = static_cast<OBB_BoxFlock*>(other);
		if (otherTree->hasTotalBox() && !this->isIntersectedWith(otherTree->getRootBox()))
		{
			return false;
		}
		else//����ཻ�ˣ���Ҫϸ��,������ӽڵ㣬�����ཻ���˳�
		{
			for (OBB_BoxFlock::SunIterator it = otherTree->begin(); it != otherTree->end(); ++it)
			{
				if (this->isIntersectedWith((*it)))
				{
					return true;
				}
			}
			return false;
		}
	}
}

CString OBB_Box::typeInfo()const
{
	return CString("OBB_Box");
}

void OBB_Box::updateByTransWorldToCur(const TRANS& matrix)
{
	m_transWorldToCur = matrix;
	m_center = matrix*origin_center;
	m_i = matrix*origin_i - matrix*Vector3D(0.0, 0.0, 0.0);
	m_j = matrix*origin_j - matrix*Vector3D(0.0, 0.0, 0.0);
	m_k = matrix*origin_k - matrix*Vector3D(0.0, 0.0, 0.0);
	//���ﲻ��������Ƭ����Ϊ��Ч�ʣ�ֻ����ʹ������Ƭ�ĸ�����ʱ�Ž�������Ƭ�ĸ���
}
Point3D OBB_Box::getCenter()const
{
	return m_center;
}

Vector3D OBB_Box::getI()const
{
	return m_i;
}
Vector3D OBB_Box::getJ()const
{
	return m_j;
}
Vector3D OBB_Box::getK()const
{
	return m_k;
}
double OBB_Box::getA()const
{
	return m_a;
}
double OBB_Box::getB()const
{
	return m_b;
}
double OBB_Box::getC()const
{
	return m_c;
}

void OBB_Box::updateTrigonsCoord()const
{
	for (int i = 0; i < m_trigons.size(); ++i)
	{
		m_trigons[i] = origin_trigons[i];//�Ȼص�ԭ���ٽ����������
		m_trigons[i].updateByTransWorldToCur(m_transWorldToCur);
	}
}

/////////////////////////////////////////
//class OBB_BoxTree
/////////////////////////////////////////

OBB_BoxFlock::OBB_BoxFlock(const OBB_Box& totalBox) : m_totalBox(totalBox)
{
	m_hasTotalBox = true;
}
OBB_BoxFlock::~OBB_BoxFlock()
{
	//������뱣֤InterferenceDetectable������ʵ�������ڶ���
	//������������ϲ�Ľڵ�������������Զ������²�Ľڵ㣬�����Box���ֹͣ
	for (std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		delete (*it);
	}
}


OBB_BoxFlock::SunIterator OBB_BoxFlock::begin()const
{
	return m_leaves.begin();
}

OBB_BoxFlock::SunIterator OBB_BoxFlock::end()const
{
	return m_leaves.end();
}

void OBB_BoxFlock::add(InterferenceDetectable * leaf)
{
	m_leaves.push_back(leaf);
}

void OBB_BoxFlock::del(InterferenceDetectable * leaf)
{
	std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin();
	for (; it != m_leaves.end(); ++it)
	{
		if (leaf == *it)
		{
			m_leaves.erase(it);
			return;
		}
	}
}

const OBB_Box& OBB_BoxFlock::getRootBox()const
{
	return m_totalBox;
}

bool OBB_BoxFlock::isIntersectedWith(InterferenceDetectable * other)const
{
	if (m_hasTotalBox && !m_totalBox.isIntersectedWith(other))//������other���ཻ�����ཻ��ֱ�ӷ���
	{
		return false;
	}
	//������������ж����ӽڵ��Ƿ������ཻ�������ཻ�������ֱ�ӷ��أ����е��ӽڵ㶼�ж���Ϻ�˵�������ཻ,�򷵻ز��ཻ
	for (std::vector<InterferenceDetectable*>::const_iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		if ((*it)->typeInfo() == "OBB_Box")//�����Ҷ�ӽڵ�
		{
			static_cast<OBB_Box*>(*it)->setLeaf(true);
		}
		if ((*it)->isIntersectedWith(other))
		{
			return true;
		}
	}
	return false;
}

CString OBB_BoxFlock::typeInfo()const
{
	return CString("OBB_BoxFlock");
}

void OBB_BoxFlock::updateByTransWorldToCur(const TRANS& matrix)
{
	m_totalBox.updateByTransWorldToCur(matrix);
	for (std::vector<InterferenceDetectable*>::iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		(*it)->updateByTransWorldToCur(matrix);
	}
}