//Comparsion between Geodetic & Reduce & Geocentric Latitude

a=6378137
b=6356752.3142
e2=1-b^2/a^2;
b=linspace(-%pi/2,%pi/2,50);   ///geodetic latitude
plot(b,b-atan(tan(b)*sqrt(1-e2)))    ///reduce latitude
plot(b,b-atan(tan(b)*(1-e2)))   ///geocenter latitude


//Compute Meridian arc length

function x=meridian_arc_s(B)
	a0=1+3/4*e2+45/64*e2^2+175/256*e2^3+11025/16384*e2^4;
	a1=3/8*e2+15/32*e2^2+525/1024*e2^3+2205/4096*e2^4;
	a2=15/256*e2^2+105/1024*e2^3+2205/16384*e2^4;
	a3=35/3072*e2^3+108/4096*e2^4;
	x=a*(1-e2)*(a0*B-a1*sin(2*B)+a2*sin(4*B)+a3*sin(6*B))
endfunction
x=meridian_arc_s(%pi/4)

x_q=integrate('(1-e2*sin(B)^2)^-1.5','B',0,%pi/4)*a*(1-e2)   // usage : integrate('function','variable',low bound,high bound)
