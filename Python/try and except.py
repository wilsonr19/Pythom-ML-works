# -*- coding: utf-8 -*-
"""
Created on Thu Jul 25 19:17:44 2019

@author: DELL
"""

data=open("C:/Users/DELL/Downloads/rob.csv",'r')
d=data.readlines()
print(d)
x=int(input("enter a row:"))
t=d[x].split(",")
for i in range(len(t)):
    for j in range(len(t)-i-1):
      if t[j]>t[j+1]:
            t[j],t[j+1]=t[j+1],t[j]
print(t)
t.insert(0,x)
int=[]
float=[]
str=[]
for x in range(len(t)):
    try:
        if(type(t[x])==int):
            int.append(t[x])
    except:
        if(type(t[x])==float):
            float.append(t[x])
    else:
        if(type(t[x])==str):
            str.append(t[x])
print("the integer values are:",int)
print("the float values are:",float)            
print("the string values are:",str)        
        
