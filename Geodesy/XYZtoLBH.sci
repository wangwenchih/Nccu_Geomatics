//recursion

function[L,B,H]=xyzTOlbh(X,Y,Z)
	a=6378137;aa=1/298.257223563;e2=2*aa-aa^2;
	L=atan(Y/X)*180/%pi;
    if X<0 then
        L=L+180;
        end
	r=(X^2+Y^2)^0.5;
		b0=atan(Z*(1+e2)/r);
	function[B1]=reglat(B0,db)
		B1=atan((Z+a*e2*tan(B0)/(1+(1-e2)*tan(B0)^2)^0.5)/r)
		mprintf("\nB1= %f,db=%e\n",B1*180/%pi,(B1-B0)*180/%pi)
		if abs(B0-B1)>db then
		B1=reglat(B1,db);
		end
	endfunction
	b=reglat(b0,1e-10);
	B=b*180/%pi;
	H=r/cos(b)-a/(1-e2*(sin(b))^2)^0.5;
endfunction

[L,B,H]=xyzTOlbh(3694472.468,3694472.428,5194534.424)	


//direct

function[L,B,H]=xyzTOlbh_s(X,Y,Z)
	a=6378137;f=1/298.257223563;e2=2*f-f^2;
	L=atan(Y/X)*180/%pi;
    if X<0 then
        L=L+180;
        end
	r=(X^2+Y^2)^0.5;
	B0=atan(Z/(r*(1-f)));
	b=atan((Z+a*e2/(1-f)*(sin(B0))^3)/(r-a*e2*(cos(B0))^3));
	H=r/cos(b)-a/(1-e2*(sin(b))^2)^0.5;
	B=b*180/%pi;
endfunction

[Ls,Bs,Hs]=xyzTOlbh_s(3694472.468,3694472.428,5194534.424)
