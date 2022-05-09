a=6378137
f=1/298.257222100882711243
e1_2=1-(1-f)^2
e2_2=1/(1-f)^2-1

function M_phi=M(phi)
	M_phi=(1-e1_2*sin(phi)^2)^-1.5*a*(1-e1_2)
endfunction

function N_phi=N(phi)
	N_phi=(1-e1_2*sin(phi)^2)^-0.5*a
endfunction

function x=meridian_arc_s(B)
	e2=e1_2
	a0=1+3/4*e2+45/64*e2^2+175/256*e2^3+11025/16384*e2^4;
	a1=3/8*e2+15/32*e2^2+525/1024*e2^3+2205/4096*e2^4;
	a2=15/256*e2^2+105/1024*e2^3+2205/16384*e2^4;
	a3=35/3072*e2^3+108/4096*e2^4;
	x=a*(1-e2)*(a0*B-a1*sin(2*B)+a2*sin(4*B)-a3*sin(6*B))
endfunction

function TM2=GeoToTM(lon,lat)
	phi=lat/180*%pi
	lam=(lon-121)/180*%pi
	N=N(phi)
	M=M(phi)
	r=N*cos(phi)
	eta2=e2_2*cos(phi)^2
	eta2=N/M-1
	
	S=meridian_arc_s(phi)
	S_q=integrate('(1-e1_2*sin(B)^2)^-1.5','B',0,phi)*a*(1-e1_2)   /// integrate('function','variable',low bound,high bound)
	
	a0=S
	a1=r
	a2=r*sin(phi)/2
	a3=r*cos(phi)^2*(1-tan(phi)^2+eta2)/6
	a4=r*sin(phi)*cos(phi)^2*(5-tan(phi)^2+9*eta2+4*eta2^2)/24
	a5=r*cos(phi)^4*(5-18*tan(phi)^2+tan(phi)^4+14*eta2-58*tan(phi)^2*eta2^2)/120
	a6=r*sin(phi)*cos(phi)^4*(61-58*tan(phi)^2+tan(phi)^4)/720
	a7=r*cos(phi)^6*(61-479+179*tan(phi)^4-tan(phi)^6)/5040
	a8=r*sin(phi)*cos(phi)^6*(1385-3111*tan(phi)^2+543*tan(phi)^4-tan(phi)^6)/40320

	E=a1*lam+a3*lam^3+a5*lam^5+a7*lam^7
	N=a0+a2*lam^2+a4*lam^4+a6*lam^6+a8*lam^8
	
	TM2=[E,N]*0.9999+[250000,0]
endfunction

PoCor=csvRead('E:\Homework\MapProjection\Geo_TM.csv',',')

for point=1:14
  en=GeoToTM(PoCor(point,4),PoCor(point,5));
  dN=PoCor(point,2)-en(2)
  dE=PoCor(point,3)-en(1)
  if abs(dE)>0.02|abs(dN)>0.02
	mprintf('\nID:'+string(point))
	mprintf('  N:'+string(dN))
	mprintf('  E:'+string(dE))
  end
  end