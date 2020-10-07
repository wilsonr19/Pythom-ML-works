# -*- coding: utf-8 -*-
"""
Created on Tue Jul 16 20:51:46 2019

@author: DELL
"""


a=[]
bubblesort=open("C:/Users/DELL/Downloads/rob.csv",'r')
de=bubblesort.readlines()
#print(de)
#for r in bubblesort:
   # print(r)
x=int(input("enter a row :"))
e=de[x].rstrip("\n").split(",")
a.append(e[0])
a.append(e[2])
e.remove(e[0])
e.remove(e[1])
for k in range(len(e)):
    e[k]=eval(e[k])
for i in range(len(e)):
    for j in range(len(e)-i-1):
            if float(e[j]) > float(e[j+1]):
                e[j],e[j+1]=float(e[j+1]),float(e[j])
e.insert(0,a[0])
e.insert(2,a[1])
print(e)
  



            

    
            

