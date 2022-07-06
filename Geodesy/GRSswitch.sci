//Geodetic Coordinate Transformation between different Reference Coordinate System (Appromixate)
//without rotating & scaling

a1=6378245;aa1=1/298.3;e_2=1-(1-aa1)^2;  //Eillpsoid(latter)

a=6378137;aa=1/298.257;e2=1-(1-aa)^2;  //Eillpsiod(former)
B0=45*%pi/180;L0=120*%pi/180;H0=2000; //Geodetic Coordinate in former Eillpsoid

dx=2;dy=-125;dz=-51.9;da=a1-a;daa=aa1-aa;   //Difference between two   Reference Coordinate System (latter-former)

N=a/(1-e2*sin(B0)^2)^0.5;
M=a*(1-e2)/(1-e2*sin(B0)^2)^1.5

Ji=[-sin(L0)/(N+H0)/cos(B0) , cos(L0)/(N+H0)/cos(B0) , 0		;
	   -sin(B0)*cos(L0)/(M+H0) , -sin(B0)*sin(L0)/(M+H0) , cos(B0)/(M+H0);
		cos(B0)*cos(L0)					  , cos(B0)*sin(L0)					  ,  sin(B0)]
	
JiA=[	0																,		0		;
			N*e2*sin(B0)*cos(B0)/a/(N+H0) ,	M*(2-e2*sin(B0)^2)*sin(B0)*cos(B0)/(1-aa)/(M+H0);
			-N*(1-e2*sin(B0)^2)/a					,	M*(1-e2*sin(B0)^2)*sin(B0)^2/(1-aa)]

dLBH=Ji*[dx;dy;dz]+JiA*[da;daa];  //Difference Between  the geodetic coordinate in two Reference Coordinate System (latter-former) (in radian)

[dL dB]=vec2list(dLBH*206264.8,ones(3,2))(1:2);  //Convert Lat & Lon difference  from radian to arc-second

LBH1=[L0 B0 H0]+dLBH';   //Geodetic Coordinate in latter Reference Coordinate System
[L1 B1 H1]=vec2list(LBH1,ones(3,2))(:);

//transfrom two geodetic coordinate(LBH) to ECEF coordinate(XYZ) respectively

X0=(N+H0)*cos(B0)*cos(L0);
Y0=(N+H0)*cos(B0)*sin(L0);
Z0=(N*(1-e2)+H0)*sin(B0);

N1=a1/(1-e_2*sin(B1)^2)^0.5;
X1=(N1+H1)*cos(B1)*cos(L1);
Y1=(N1+H1)*cos(B1)*sin(L1);
Z1=(N1*(1-e_2)+H1)*sin(B1)

dxyz=[X1 Y1 Z1]-[X0 Y0 Z0]  //check (dxyz=[dx ; dy ; dz])
