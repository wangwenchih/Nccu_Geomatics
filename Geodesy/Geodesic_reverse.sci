funcprot(0)
function rad=dms2rad(dms)
	rad=(dms(1)+dms(2)/60+dms(3)/3600)/180*%pi
endfunction
function dms=rad2dms(rad)
	deg=rad*180/%pi
	d=int(deg)
	ms=(deg-d)*60
	m=int(ms)
	s=(ms-m)*60
	dms=[d m s]
endfunction
a=6378245;b=6356863.018770473;e2=1-b^2/a^2;
L1=[114 20 0];B1=[30 30 0];L2=[51 16 32.4976];B2=[-37 -43 -44.1351];
L1=dms2rad(L1)
B1=dms2rad(B1)
L2=dms2rad(L2)
B2=dms2rad(B2)

sin_u1=sin(B1)*(1-e2)^0.5/(1-e2*sin(B1)^2)^0.5
sin_u2=sin(B2)*(1-e2)^0.5/(1-e2*sin(B2)^2)^0.5
cos_u1=cos(B1)/(1-e2*sin(B1)^2)^0.5
cos_u2=cos(B2)/(1-e2*sin(B2)^2)^0.5
a1=sin_u1*sin_u2
a2=cos_u1*cos_u2
b1=cos_u1*sin_u2
b2=sin_u1*cos_u2
lam_0=L2-L1

function  [lam,A1,sig,x,cos2_A0]=delta_iteration(del0)
	lam=lam_0+del0
	p=cos_u2*sin(lam)
	q=b1-b2*cos(lam)
	A1=atan(p/q)
	if (p*q>0) then
		A1=abs(A1)
	else
		A1=-abs(A1)
	end
	if (q<0) then
		A1=%pi+A1
	end
	sin_sig=p*sin(A1)+q*cos(A1)
	cos_sig=a1+a2*cos(lam)
	sig=atan(sin_sig/cos_sig)
	if (sig>0) then
		sig=abs(sig)
	else
		sig=%pi-abs(sig)
	end
	sin_A0=cos_u1*sin(A1)
	cos2_A0=1-sin_A0^2
	alp=(e2/2+e2^2/8+e2^3/16)-(e2^2+e2^3)*cos2_A0/16+3*e2^3*cos2_A0^2/128
	beta=((e2^2+e2^3)*cos2_A0/32-e2^3*cos2_A0^2/64)
	x=2*a1-cos2_A0*cos_sig
	del=(alp*sig-2*beta*x*sin_sig)*sin_A0
	
	disp(beta*1e8,del*206264.8)
	
	if abs(del-del0)>1e-20 then
		[lam,A1,sig,x,cos2_A0]=delta_iteration(del);
	end
	endfunction

[lam,A1,sig,x,cos2_A0]=delta_iteration(0)
y=(cos2_A0^2-2*x^2)*cos(sig)

k2=(a^2/b^2-1)*cos2_A0
A=b*(1+k2/4-3/64*k2^2+5/256*k2^3)
B=b*(k2/8-k2^2/32+15/1024*k2^3)
C=b*(k2^2/128-3/512*k2^3)

S=A*sig+(x*2*B/cos2_A0+y*2*C/cos2_A0^2)*sin(sig)
A2=atan(cos_u1*sin(lam)/(b1*cos(lam)-b2))
A1=rad2dms(A1)
A2=rad2dms(A2)

