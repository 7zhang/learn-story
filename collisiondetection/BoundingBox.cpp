// BoundingBox.cpp: implementation of the BoundingBox class.
//
//////////////////////////////////////////////////////////////////////
#include "BoundingBox.h"
#include <fstream>
#include <algorithm>
#include <cmath>
#include <float.h>

//用来比较大小的两个小函数
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
	//判断三角形1在三角形2所在平面的一侧
	if ( (su > 0 && sv > 0 && sw > 0) || (su < 0 && sv < 0 && sw < 0) )
	{//同时为正或负，顶点在同一侧，说明不相交，相交测试结束
		return false;
	}
	//全部为0，两个三角形共面
	//判断二维空间内两个三角形的三条边是否有相交，若相交则返回true，反之返回false
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
	
	//判断三角形2在三角形1所在平面的一侧
	if ( (sa > 0 && sb > 0 && sc > 0) || (sa < 0 && sb < 0 && sc < 0) )
	{//同时为正或负，顶点在同一侧，说明不相交，相交测试结束
		return false;
	}

	//两个三角形所在平面相交，求交线上一点P，交线的方向D为两个三角形法向量的叉乘
	double s1 = normal^(U-Point3D(0.0,0.0,0.0));
	double s2 = other.normal^(A-Point3D(0.0,0.0,0.0));
	double n1n2 = normal^other.normal;
	double a = (s2*n1n2-s1)/(n1n2*n1n2-1);
	double b = (s1*n1n2-s2)/(n1n2*n1n2-1);
	Vector3D OP = a*normal+b*other.normal;
	Point3D P = Point3D(0.0,0.0,0.0)+OP;
	Vector3D D = normal*other.normal;

	//交线L：P+tD，求解两个三角形与交线的交点的t值，即t0,t1,t2,t3
	Vector3D UV = V-U;
	Vector3D VW = W-V;
	Vector3D WU = U-W;
	Vector3D AB = B-A;
	Vector3D BC = C-B;
	Vector3D CA = A-C;
	double t0,t1,t2,t3;
	if (su*sv<0 && su*sw<0 )//1.说明点U和V,U和W分布在三角形ABC的两侧，与L必有交点，由于共面，只需解二元一次方程即可
	{
		double deta = UV.dx*D.dy-UV.dy*D.dx;//判断除数是否为0
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

		deta = WU.dx*D.dy-WU.dy*D.dx;//判断除数是否为0
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
		double deta = UV.dx*D.dy-UV.dy*D.dx;//判断除数是否为0
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
		
		deta = VW.dx*D.dy-VW.dy*D.dx;//判断除数是否为0
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
		double deta = WU.dx*D.dy-WU.dy*D.dx;//判断除数是否为0
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
		
		deta = VW.dx*D.dy-VW.dy*D.dx;//判断除数是否为0
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

	if (sa*sb<0 && sb*sc<0 )//4说明点A和B,B和C分布在三角形UVW的两侧，与L有交点
	{
		double deta = BC.dx*D.dy-BC.dy*D.dx;//判断除数是否为0
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
		double deta = BC.dx*D.dy-BC.dy*D.dx;//判断除数是否为0
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
//先判断两个三角形的三条边是否有相交，若相交则返回true，反之下一步
//再判断是否有点在三角形内，若有则说明存在包含情况，返回true，反之返回false
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
//假设该点在三角片所在平面内,若在三角片内，则向量AU，AV，AW两两夹角相加为360度
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
//输入四个点分别为线段的端点，x、y、z轴为两条线段的分离轴，只要在一个轴上的投影不重合就说明不相交
bool TrigonChip::isTwoLineIntersected(Point3D p1, Point3D p2, Point3D p3, Point3D p4) const
{
	double left1, right1, left2, right2;
	//x轴
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
	//y轴
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
	//z轴
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
//返回的为弧度
double TrigonChip::getAngleOfTwoVector(Vector3D v1, Vector3D v2)const
{
	double cosx = (v1^v2)/(v1.get_length()*v2.get_length());
	return acos(cosx);
}

//----------------------------------------------------------------------------
//契约：点UV已经在此三角片的两侧
//作用：判断此三角是否被线段贯穿
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
void STLModel::loadSTLFile(CString stlname)//以二进制的方式来读取stl文件
{
	m_trigonChips.clear();

	std::ifstream fin;
	fin.open(stlname, std::ios::binary);
	if (!fin.is_open())
	{
		throw std::runtime_error("file open error");
		return;
	}
	
	//读入前80个字节，其为模型的名称
	char modelName[81] = {0};//以'\0'结尾，所以这里预留一个字节
	fin.read(modelName, 80);
	m_modelName = std::string(modelName);
	
	int trigonNum;
	//读入接下来的4个字节，其为三角片的个数
	fin.read(reinterpret_cast<char*>(&trigonNum), 4);
	
	//迭代式读入三角片，50个字节为一组
	for (int i = 0; i < trigonNum; ++i)
	{
		//50个字节的意义：
		//3个4字节浮点数，用来描述三角面片的法向量
		//3个4字节浮点数，用来描述第1个顶点的坐标
		//3个4字节浮点数，用来描述第2个顶点的坐标
		//3个4字节浮点数，用来描述第3个顶点的坐标
		//并将坐标值由毫米转换为米
		//最后2个字节暂时没用，本意是代表颜色
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
//从三角片集来构建层次包围盒
InterferenceDetectable* STLModel::constructBoxTree()const
{
	InterferenceDetectable* res = NULL;
	
	recursivelyConstructBoxTree(res, m_trigonChips, 1);//当前构造第一层
	return res;
}

//----------------------------------------------------------------------------
void STLModel::recursivelyConstructBoxTree(InterferenceDetectable* &node, const std::vector<TrigonChip>& chips, int curDeep)const
{
	//首先判断chips是不是可以进行分割
	//若不能进行分割，则构建一个整体的Box后终止迭代
	//若能分割，则构建整体的Box后还要搭建树形结构
	AABB_Box box(chips);
	int n = chips.size();//总的三角片个数
	if (curDeep >= m_maxDepth || n < 2)//超过层数则退出
	{
		//无需再分裂，返回一个Box节点
// 		if (n>m_maxTrigonNum)
// 			node = new AABB_BoxFlock(box, chips);
// 		else
			node = new AABB_Box(box);
		return;
	}

	//判断box的哪个轴最长，次长，最短，获取分离轴的顺序
	std::vector<int> seq = box.getAxisLengthSeq();
	std::vector<Vector3D> seperatingAxisVec;
	for (std::vector<int>::iterator it = seq.begin(); it != seq.end(); ++it)
	{
		if ((*it) == 1)
		{
			Vector3D X(1.0,0.0,0.0);//X轴法向量
			seperatingAxisVec.push_back(X);
		}
		else if ((*it) == 2)
		{
			Vector3D Y(0.0,1.0,0.0);//X轴法向量
			seperatingAxisVec.push_back(Y);
		}
		else
		{
			Vector3D Z(0.0,0.0,1.0);//X轴法向量
			seperatingAxisVec.push_back(Z);
		}
	}

	//依次尝试三个分裂轴，将三角片拆分成两份，只要有一个分离轴满足拆分条件即可
	//若三个分离轴都不满足，则表明已不能拆分
	vector<TrigonChip> leftChips, rightChips;
	for (int i = 0; i < seperatingAxisVec.size(); ++i)
	{
		Vector3D seperatingAxis = seperatingAxisVec[i];
		leftChips.clear();
		rightChips.clear();
		
		for (int j = 0; j < chips.size(); ++j)
		{
			Vector3D m = chips[j].getCenter() - box.m_center;
			double dot = seperatingAxis^m;//向量点乘
			if (dot < -0.001)
			{
				rightChips.push_back(chips[j]);
			}
			else
			{
				leftChips.push_back(chips[j]);
			}
		}
		//如果leftChips里为空或者为所有chip的总数,则换另一个分裂轴
		if (leftChips.size() != 0 && leftChips.size() != n)
		{
			break;
		}
	}
	//表示3个分裂轴都未能满足要求
	if (i == 3)
	{
		//无需再分裂，返回一个Box节点
		if (n>m_maxTrigonNum)
			node = new AABB_BoxFlock(box, chips);
		else
			node = new AABB_Box(box);
	}
	else
	{
		//分裂成功
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
	
	recursivelyConstructBoxTree2(res, m_trigonChips, 1);//当前构造第一层
	return res;
}


void STLModel::recursivelyConstructBoxTree2(InterferenceDetectable* &node, const std::vector<TrigonChip>& chips, int curDeep)const
{
	//首先判断chips是不是可以进行分割
	//若不能进行分割，则构建一个整体的Box后终止迭代
	//若能分割，则构建整体的Box后还要搭建树形结构
	OBB_Box box(chips);
	int n = chips.size();//总的三角片数
	if (curDeep >= m_maxDepth || n < 2)//超过层数则退出
	{
		node = new OBB_Box(box);
		return;
	}
	std::vector<TrigonChip> leftChips, rightChips;
	
	//判断box的哪个轴最长，次长，最短
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
	{//依次尝试三个分裂轴
		Vector3D seperatingAxis = seperatingAxisVec[i];
		leftChips.clear();
		rightChips.clear();
		
		for (int j = 0; j < chips.size(); ++j)
		{
			Vector3D m = chips[j].getCenter() - box.getCenter();
			double dot = seperatingAxis^m;//向量点乘
			if (dot < 0.0)
			{
				rightChips.push_back(chips[j]);
			}
			else
			{
				leftChips.push_back(chips[j]);
			}
		}
		
		//如果leftChips里为空或者为所有chip的总数,则换另一个分裂轴
		if (leftChips.size() != 0 && leftChips.size() != n)
		{
			break;
		}
	}
	if (i == 3)//表示3个分裂轴都未能满足要求
	{
		//无需再分裂，返回一个Box节点
		node = new OBB_Box(box);
	}
	else
	{
		//分裂成功
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
	unsigned int n = trigonVec.size();//三角片个数
	//比较每一三角片的顶点，求出xMin,xMax,yMin,yMax,zMin,zMax
	//用第一个三角片的参数初始化参数
	m_pointMin = trigonVec[0].vex[0];
	m_pointMax = trigonVec[0].vex[0];

	for (int i=0; i<n; i++)
	{
		//三角片的三个顶点
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
	//设置备忘录
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
	//用第一个参数初始化
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
	//三角片的三个顶点
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
	//设置备忘录
	origin_pointVec = m_pointVec;
	origin_trigons = m_trigons;
}

//----------------------------------------------------------------------------
//根据AABB包围盒的特性，只需比较两个盒子在3个坐标轴方向的投影是否重叠
//只要有一个轴上不重叠就说明不相交，这3个坐标轴为世界坐标系的坐标轴。
bool AABB_Box::isIntersectedWith(const AABB_Box& other)const
{
	//求出两个包围盒中心点之间的向量
	Vector3D twoCenter(m_center.x-other.m_center.x, m_center.y-other.m_center.y, m_center.z-other.m_center.z);
	//分别判断两个包围盒在世界坐标系X轴、Y轴、Z轴上的投影是否重叠
	//X轴
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
	//更新长方体顶点
	for (int i=0; i<8; i++)
	{
		m_pointVec[i] = matrix*origin_pointVec[i];
	}

	updateMinMax();//更新最大最小顶点坐标，必须在顶点坐标更新以后
	setParam();//包围盒坐标更新后，对应的长宽高和中心点都需要更新
}

//----------------------------------------------------------------------------
// void AABB_Box::updateTrigonsCoord()const
// {
// 	for (int i = 0; i < m_trigons.size(); ++i)
// 	{
// 		m_trigons[i] = origin_trigons[i];//利用原始值进行坐标更新
// 		m_trigons[i].updateByTransWorldToCur(m_transWorldToCur);
// 	}
// }

//----------------------------------------------------------------------------
bool AABB_Box::isIntersectedWith(InterferenceDetectable * other)const
{
	if ( other->typeInfo() == "AABB_Box" )
	{
		AABB_Box* otherBox = static_cast<AABB_Box*>(other);
		if(this->isIntersectedWith(*otherBox))//盒子之间干涉
		{
			//return true;
			//如果相交，判断盒子中包围的三角片是否相交
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
		else//如果相交了，则还要细看,检测其子节点，发现相交则退出
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
	//这里必须保证InterferenceDetectable的所有实例都是在堆上
	//巧妙的析构：上层的节点调用析构，会自动调用下层的节点，如果是Box则会停止
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
	if (m_isHasTotalBox && !m_totalBox.isIntersectedWith(other))//整体与other不相交，则不相交，直接返回
	{
		return false;
	}
	//接下来，逐次判断其子节点是否与其相交，出现相交的情况，直接返回；所有的子节点都判断完毕后，说明都不相交,则返回不相交
	for (std::vector<InterferenceDetectable*>::const_iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		if ((*it)->typeInfo() == "AABB_Box")//如果是叶子节点
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
//为了提高碰撞检测算法效率，如果有总体包围盒，只更新总体包围盒，如果没有，则更新下一层子节点
//还没实现上述的功能，这里全部更新
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
	//仅仅用于测试的构造函数
	m_isLeaf = false;
}

OBB_Box::OBB_Box(const std::vector<TrigonChip>& trigonVec)//这个方法耗费空间与时间
{
	m_trigons = trigonVec;
	double zero[9] = {0};
	Matrix3D C(zero);//协方差矩阵
	Point3D u;//均值点
	
	unsigned int n = trigonVec.size();
	unsigned int i = 0, j = 0, k = 0;
	//Ai表示为三角片i的面积，A为三角片总面积
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
	Matrix3D eigenvector_matrix;//特征向量矩阵
	double eigenvalue_array[3];//特征值数组
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

	//确定长宽高
	std::vector<double> aVec;
	std::vector<double> bVec;
	std::vector<double> cVec;
	for (i = 0; i < n; ++i)
	{
		//每个trigon有三个顶点
		for (j = 0; j < 3; ++j)
		{
			Vector3D ov = trigonVec[i].vex[j] - m_center;
			aVec.push_back(ov ^ m_i);//向量点积
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

	//由于中心的选择可能有偏移，这里进行调整
	m_center += (aMin+aMax)/2.0 * m_i;
	m_center += (bMin+bMax)/2.0 * m_j;
	m_center += (cMin+cMax)/2.0 * m_k;

	//设置备忘录数据，即原始数据
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
	//15条潜在分离轴一一实验，如果有一条能够使两个Box分离则退出并返回false
	//15条都不能分离，则判断为两者相交，即返回true
	//这15条分离轴为：每个box的3个坐标轴；这边三条边与那边三条边之间的相互叉乘得到的轴
	std::vector<Vector3D> separatingAxisVec;//存放分离轴的容器
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
	Vector3D L;//分离轴
	Vector3D T;//中心的连线
	double a1 = m_a / 2.0;//半边长
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

		//更新值
		ra = fabs((m_i*a1)^L) + fabs((m_j*a2)^L) + fabs((m_k*a3)^L);
		rb = fabs((other.m_i*b1)^L) + fabs((other.m_j*b2)^L) + fabs((other.m_k*b3)^L);
		tl = fabs(T ^ L);
		if (tl > ra + rb)//表示这个是分离轴，华丽丽地把A和B分离了
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
		if(this->isIntersectedWith(*otherBox))//盒子之间干涉
		{
			//如果相交，判断盒子中包围的三角片是否相交
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
		else//如果相交了，则还要细看,检测其子节点，发现相交则退出
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
	//这里不更新三角片，是为了效率，只有在使用三角片的干涉检查时才进行三角片的更新
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
		m_trigons[i] = origin_trigons[i];//先回到原点再进行坐标更新
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
	//这里必须保证InterferenceDetectable的所有实例都是在堆上
	//巧妙的析构：上层的节点调用析构，会自动调用下层的节点，如果是Box则会停止
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
	if (m_hasTotalBox && !m_totalBox.isIntersectedWith(other))//整体与other不相交，则不相交，直接返回
	{
		return false;
	}
	//接下来，逐次判断其子节点是否与其相交，出现相交的情况，直接返回；所有的子节点都判断完毕后，说明都不相交,则返回不相交
	for (std::vector<InterferenceDetectable*>::const_iterator it = m_leaves.begin(); it != m_leaves.end(); ++it)
	{
		if ((*it)->typeInfo() == "OBB_Box")//如果是叶子节点
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