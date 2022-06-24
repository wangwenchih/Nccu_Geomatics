
import numpy as np
from PIL import Image
import pandas as pd
def ConfusionMatrix(GrndTruth,Classified):  #Rasterize_GrndTruth.tif,Classified.tif
    GT=np.asarray(Image.open(GrndTruth))
    Clsf=np.asarray(Image.open(Classified))
    GTclasses={0:'water',1:'building',2:'forest'} 
    ClassTable={0:'water',1:'cloud',2:'building',3:'other',4:'forest',5:'forest',6:'other'} #All classes
    VdDict={} #validation pixel's class and [col,row]
    Class_Truth=[]
    Class_Predicted=[]
    for Gvalue in GTclasses:
        VdDict[Gvalue]=np.argwhere(GT==Gvalue).tolist() #index.type(np.array->list)
        Gclass=GTclasses[Gvalue] #Classname(Ground Truth)
        for index in VdDict[Gvalue]:
            indices=index[0],index[1] #row,colum
            Cvalue=Clsf[indices]    #Corresponed pixel value in 'Classified'
            cla=ClassTable[Cvalue] #Classname(Classified)
            Class_Truth.append(Gclass)
            Class_Predicted.append(cla)
            if cla!=Gclass:
                print(indices,Gclass,cla)
    df=pd.DataFrame(list(zip(Class_Truth,Class_Predicted)),columns =['Truth', 'Predicted'])
    CM=pd.crosstab(df['Predicted'],df['Truth'],margins=True)
    print(CM)
    p0=0;p1=0
    n=CM['All']['All']
    for cla in GTclasses.values():
        try:
            p0+=CM[cla][cla]/n
            p1+=CM[cla]['All']/n*CM['All'][cla]/n
        except:
            continue
    kappa=(p0-p1)/(1-p1)
    print("Cohen's Kappa:%.5f"%kappa)
    return CM,kappa

CMdict={}
Kappadict={}
from pathlib import Path
dir='Classified'
tifs=Path(dir).glob('*.tif')
for file in tifs:    
    filename=str(file)[len(dir)+1:-4]
    CMdict[filename],Kappadict[filename]=ConfusionMatrix('Rasterize_HW06.tif',file)
KappaDF=pd.DataFrame({'Node x Layer':Kappadict.keys(),'Kappa':Kappadict.values()})
print(KappaDF.sort_values(by=['Kappa']))
