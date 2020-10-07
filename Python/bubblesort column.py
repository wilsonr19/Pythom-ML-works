# -*- coding: utf-8 -*-
"""
Created on Wed Jul 17 13:49:53 2019

@author: DELL
"""

data=open("C:/Users/DELL/Downloads/rob.csv",'r')
d=data.readlines()
#print(d)
s=[]
y=int(input("enter a column:"))
[s.append(eval(i.split(",")[y]))for i in d[1:50]]
for j in range(len(s)):
    for k in range(len(s)-j-1):
         if s[k] > s[k+1]:
             s[k],s[k+1]=s[k+1],s[k]
print(s)
