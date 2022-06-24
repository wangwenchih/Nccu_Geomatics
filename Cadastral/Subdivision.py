from sympy import symbols, Eq,solve
known={'C':[40,65],'B':[60,30],'P':[31.6666,63.3333],'A':[10,20]} #已知點
x,y=symbols('x y') #分割點坐標
order=['P','C','B','Q'] #切割後多邊形角點(順時針)
#order=['Q','B','C','P']
polygon=[]
K_area=487.5 #欲切割面積
for point in order:  #建立欲切割之多邊形
    try:
        polygon.append(known[point])
    except:
        polygon.append([x,y])
def C_area():  #面積計算
    area2=0
    for index in range(len(polygon)):
        i=index
        j=index+1
        if index==len(polygon)-1:
            j=0
        x_i=polygon[i][0]
        y_i=polygon[i][1]
        x_j=polygon[j][0]
        y_j=polygon[j][1]
        area2+=x_i*y_j-y_i*x_j #計算行列式値
    area=-area2/2
    return area

area_const=Eq(C_area(),K_area) #面積條件
head='A' #分割點所在線段端點(頭)
end='B'  #分割點所在線段端點(尾)
x1,y1=known[head]
x2,y2=known[end]
line_const=Eq((x-x1)/(x2-x1),(y-y1)/(y2-y1)) #共線條件

ans=solve([area_const,line_const],[x,y])
print(ans)
print(C_area().subs(ans)) #驗算面積
print(polygon)
