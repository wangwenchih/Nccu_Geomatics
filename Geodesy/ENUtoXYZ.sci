// Local Cartesian Coordinate to ECEF Coordinate 

B0=33.7366*%pi/180 ; L0=45*%pi/180; 	//Latitude & Lontitude of the station

r=230000000 ; A=120*%pi/180 ; H=45*%pi/180;
// r=distanse   A=azimuth  H=vertical angle

X0=3694472.468 ; Y0=3694472.468 ; Z0=5194534.424; 	//ECEF Coordinate of the station

dENU=[r*cos(H)*cos(A);r*cos(H)*sin(A);r*sin(H)]   // Local Cartesian Coordinate of the target

M=[-cos(L0)*sin(B0),-sin(L0),cos(B0)*cos(L0);
	-sin(B0)*sin(L0),cos(L0),cos(B0)*sin(L0);
	cos(B0)			,0		,sin(B0)]

dXYZ=M*dENU  		//ECEF Coordinate difference between target & station

XYZ=[X0;Y0;Z0]+dXYZ 		//ECEF Coordinate of the target

dENU2=inv(M)*dXYZ  		//check (dENU2=dENU)
