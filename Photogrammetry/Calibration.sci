function dr=Rd(r)
	dr=-1.506e-2*r^2+2.721e-3*r^4+0*r^6
endfunction
r=linspace(0,2.68,50);
plot(r,Rd)

deff('[vx]=fx(x,y)','vx=x*(-1.506e-2*(x^2+y^2)+2.721e-3*(x^2+y^2)^2)/sqrt(x^2+y^2)')
deff('[vy]=fy(x,y)','vy=y*(-1.506e-2*(x^2+y^2)+2.721e-3*(x^2+y^2)^2)/sqrt(x^2+y^2)')
x=linspace(-2.15,2.15,40);
y=linspace(-1.64,1.64,40);
vx=feval(x,y,fx);
vy=feval(x,y,fy);
champ1(x,y,vx,vy)
z=sqrt(vx.^2+vy.^2);
surf(x,y,z)

deff('[dx]=gx(x,y)','dx=6.851e-4*((x^2+y^2)+2*x^2)-6.078e-4*2*x*y')
deff('[dy]=gy(x,y)','dy=-6.078e-4*((x^2+y^2)+2*y^2)+6.851e-4*2*x*y')
dx=feval(x,y,gx);
dy=feval(x,y,gy);
champ1(x,y,dx,dy)
p=sqrt(dx.^2+dy.^2);
surf(x,y,p)
