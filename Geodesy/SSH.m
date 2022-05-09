m=5; 
n=12;
theta=0:0.5:180;
lamda=-180:1:180;
[LAMDA,THETA]=meshgrid(lamda,theta);
DATA=zeros(361,361);
DATA1=zeros(361,361);

for i=1:361
    for j=1:361
        DATA(i,j)=NLegendre_Fun(n,m, cos(THETA(i,j)*pi/180)) * cos(m * LAMDA(i,j)*pi/180);
        if DATA(i,j)>0
            DATA1(i,j)=1;
        elseif DATA(i,j)<0
            DATA1(i,j)=-1;
        else
            DATA1(i,j)=0;
        end
    end
end
[x,y,z]=sphere(360);
surf(x,y,z,DATA1);
set(gca,'visible','off')
axis equal
shading flat
colormap gray

function [output] = NLegendre_Fun(n,m,t)
output=zeros(n+1,m+1);
output(1,1)=1;
output(2,1)=sqrt(3)*t;
output(2,2)=sqrt(3)*sqrt(1-t^2);
%Recursively compute the elements of the diagonal until degree m
for i=3:m+1
    nn=i-1;
    output(i,i)=sqrt((2*nn+1)/(2*nn))*sqrt(1-t^2)*output(i-1,i-1);
end
%P(m+1,m)
if n>m
    nn=m+1;
    output(m+2,m+1)=sqrt(2*nn+1)*t*output(m+1,m+1);
end
%P(n,m)
if n>m+1
    for i=m+3:n+1
        nn=i-1;
        output(i,m+1)=sqrt(((2*nn-1)*(2*nn+1))/((nn-m)*(nn+m)))*t*output(i-1,m+1) - sqrt(((2*nn+1)*(nn+m-1)*(nn-m-1))/((2*nn-3)*(nn+m)*(nn-m)))*output(i-2,m+1);
    end
end
output=output(n+1,m+1);
end