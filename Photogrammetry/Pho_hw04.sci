xp=0.7831;
yp=0.4405;
k1=1.529e-4;
k2=-4.305e-7;
p1=-4.33e-6;
p2=-1.887e-4;

deff('[l]=norm(x,y)','l=sqrt(x^2+y^2)')
deff('[L]=norm_v(X,Y)','L=sqrt(X.^2+Y.^2)')

function []=champxy(dx,dy,title)
	champ(x,y,dx,dy)
	xtitle(title)
	norm_d=norm_v(dx,dy)
	colorbar(min(norm_d),max(norm_d))
endfunction

r=linspace(0,norm(xp,yp),40);
dr=r.*(k1*r.^2+k2*r.^4);
xgrid()
plot(r,dr)
xtitle('輻射畸變差（徑向）','徑向距離（mm）')


deff('[vx]=fx(x,y)','vx=x*(k1*(x^2+y^2)+k2*(x^2+y^2)^2)')
deff('[vy]=fy(x,y)','vy=y*(k1*(x^2+y^2)+k2*(x^2+y^2)^2)')
x=linspace(-xp,xp,40);
y=linspace(-yp,yp,40);
vx=feval(x,y,fx);
vy=feval(x,y,fy);

champxy(vx,vy,'輻射畸變差（向量場）')

deff('[dx]=gx(x,y)','dx=p1*((x^2+y^2)+2*x^2)+p2*2*x*y')
deff('[dy]=gy(x,y)','dy=p2*((x^2+y^2)+2*y^2)+p1*2*x*y')
dx=feval(x,y,gx);
dy=feval(x,y,gy);

show_window(1)
champxy(dx,dy,'離心畸變差（向量場）')

show_window(2)
champxy(vx+dx,vy+dy,'總畸變差（向量場）')

show_window(3)
surf(x,y,norm_v(vx+dx,vy+dy))
xtitle('總畸變差（純量）')
colorbar(min(norm_v(vx+dx,vy+dy)),max(norm_v(vx+dx,vy+dy)))

show_window(4)
contour(x,y,norm_v(vx+dx,vy+dy),10)
xtitle('總畸變差（等值線）')
