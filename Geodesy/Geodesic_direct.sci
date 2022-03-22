B1=[30 30 0];L1=[114 20 0];A1=[225 0 0];		//S=1e7;
/*B1=[30 0 0];L1=[108 30 0];A1=[45 0 0];S=linspace(0,1e6,1000);*/

function rad=dms2rad(dms)
	rad=(dms(1)+dms(2)/60+dms(3)/3600)/180*%pi
endfunction

B1=dms2rad(B1)
L1=dms2rad(L1)
A1=dms2rad(A1)

a=6378245;b=6356863.018770473;e2=1-b^2/a^2;

X2=[];Y2=[];Z2=[];

w=(1-e2*sin(B1)^2)^0.5
sin_u1=sin(B1)*(1-e2)^0.5/w
cos_u1=cos(B1)/w

sin_A0=cos_u1*sin(A1)
cos2_A0=1-sin_A0^2
k2=(a^2/b^2-1)*cos2_A0

A=b*(1+k2/4-3/64*k2^2+5/256*k2^3)
B=b*(k2/8-k2^2/32+15/1024*k2^3)
C=b*(k2^2/128-3/512*k2^3)

alp=(e2/2+e2^2/8+e2^3/16)-(e2^2+e2^3)*cos2_A0/16+3*e2^3*cos2_A0^2/128
beta=(e2^2+e2^3)*cos2_A0/32-e2^3*cos2_A0^2/64

cot_sig1=cos_u1*cos(A1)/sin_u1
sin_2sig1=2*cot_sig1/(cot_sig1^2+1)
cos_2sig1=(cot_sig1^2-1)/(cot_sig1^2+1)

function [X2,Y2,Z2]=geodesic(S)
	global L2 B2 A2
	
	sig0=(S-(B+C*cos_2sig1)*sin_2sig1)/A
	
	sig=sig0+(B+5*C*(cos_2sig1*cos(2*sig0)-sin_2sig1*sin(2*sig0)))*(sin_2sig1*cos(2*sig0)+cos_2sig1*sin(2*sig0))/A
	del=(alp*sig+beta*(sin_2sig1*cos(2*sig0)+cos_2sig1*sin(2*sig0)-sin_2sig1))*sin_A0
	sin_u2=sin_u1*cos(sig)+cos_u1*cos(A1)*sin(sig)
	B2=atan(sin_u2/(1-e2)^0.5/(1-sin_u2^2)^0.5)
	lam_i=atan(sin(A1)*sin(sig)/(cos_u1*cos(sig)-sin_u1*sin(sig)*cos(A1)))
	
	if (sin(A1)*tan(lam_i)>0) then
		lam=abs(lam_i)
	else
		lam=abs(lam_i)-%pi
	end
	if (tan(lam_i)<0) then
		lam=-lam
	end
	
	L2=L1+lam-del
	A2=atan(cos_u1*sin(A1)/(cos_u1*cos(sig)*cos(A1)-sin_u1*sin(sig)))
	
	if (sin(A1)<0) then
		A2=abs(A2)
	else
		A2=-abs(A2)
	end
	if (sin(A1)*tan(A2)>0) then
		A2=%pi-A2
	end
	N2=a/(1-e2*sin(B2)^2)^0.5;
	X2=[X2 (N2)*cos(B2)*cos(L2)];
	Y2=[Y2 (N2)*cos(B2)*sin(L2)];
	Z2=[Z2 (N2*(1-e2))*sin(B2)];
endfunction

function dms=rad2dms(rad)
	deg=rad*180/%pi
	d=int(deg)
	ms=(deg-d)*60
	m=int(ms)
	s=(ms-m)*60
	dms=[d m s]
	endfunction

for l=1:1000
	[X2,Y2,Z2]=geodesic(10000*l)
	end

global L2 B2 A2

L2=rad2dms(L2)
B2=rad2dms(B2)
A2=rad2dms(A2)

function [x,y,z]=ellipsoid(xr,yr,zr,n)
	theta = (-n:2:n)/n*%pi;
	phi = (-n:2:n)'/n*%pi/2;
	cosphi = cos(phi); 
	cosphi(1) = 0; 
	cosphi(n+1) = 0;
	sintheta = sin(theta); 
	sintheta(1) = 0; sintheta(n+1) = 0;
	x = xr*cosphi*cos(theta);
	y = yr*cosphi*sintheta;
	z = zr*sin(phi)*ones(1,n+1);
	endfunction
[x,y,z]=ellipsoid(a,a,b,50)
surf(x,y,z,'facecol','none')

param3d(X2, Y2, Z2,theta =75, alpha = 75)
curve = gce();
curve.mark_mode = "on";
curve.mark_foreground = color("magenta");
