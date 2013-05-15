#include "trianglecollisiondetection.h"

bool trianglecollisiondetection(triangle &t1, triangle &t2)
{
	vector3d diff11;
	vector3d diff21;
	vector3d diff31;
	vectorminus(t1.vertex1, t2.vertex1, diff11);
	vectorminus(t1.vertex2, t2.vertex1, diff21);
	vectorminus(t1.vertex3, t2.vertex1, diff31);

	float dot1, dot2, dot3;
	vectordot(diff11, t2.normalvector, dot1);
	vectordot(diff21, t2.normalvector, dot2);
	vectordot(diff31, t2.normalvector, dot3);

	if((dot1 > ZERO  && dot2 > ZERO && dot3 > ZERO) || (dot1 < -ZERO && dot2 < -ZERO && dot3 < -ZERO))
	{
		return false;
	}
/*	else if(ISZERO(dot1) && ISZERO(dot2) && ISZERO(dot3))
	{
		return trianglecollisiondetection2d(t1, t2);
	}
*/
	vectorminus(t2.vertex1, t1.vertex1, diff11);
	vectorminus(t2.vertex2, t1.vertex1, diff21);
	vectorminus(t2.vertex3, t1.vertex1, diff31);

	float dot4, dot5, dot6;
	vectordot(diff11, t1.normalvector, dot4);
	vectordot(diff21, t1.normalvector, dot5);
	vectordot(diff31, t1.normalvector, dot6);

	if((dot4 > ZERO && dot5 > ZERO && dot6 > ZERO) || (dot4 < -ZERO && dot5 < -ZERO && dot6 < -ZERO))
	{
		return false;
	}

	return true;
}
/*
	vector3d cross = vectorcross(t1.normalvector, t2.normalvector);
	vector3d p;
	float s1 = vectordot(t1.vertex1, t1.normalvector);
	float s2 = vectordot(t2.vertex1, t2.normalvector);
	if(!ISZERO(cross.z))
	{
		p.x = (t2.normalvector.y * s1 - t1.normalvector.y * s2)/cross.z;
		p.y = (t1.normalvector.x * s2 - t2.normalvector.x * s1)/cross.z;
		p.z = 0;
	}
	else if(!ISZERO(cross.y))
	{
		p.x = (t1.normalvector.z * s2 - t2.normalvector.z * s1)/cross.y;
		p.y = 0;
		p.z = (t2.normalvector.x * s1 - t1.normalvector.x * s2)/cross.y;
	}
	else
	{
		p.x = 0;
		p.y = (t2.normalvector.z * s1 - t1.normalvector.z * s2)/cross.z;
		p.z = (t1.normalvector.y * s2 - t2.normalvector.y * s1)/cross.z;
	}

	if((dot1 < 0 && dot2 > 0 && dot3 > 0) || (dot1 > 0 && dot2 < 0 && dot3 < 0))
	{



*/




