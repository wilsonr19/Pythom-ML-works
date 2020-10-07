# -*- coding: utf-8 -*-
"""
Created on Tue Sep  3 19:39:29 2019

@author: DELL
"""
#BUBBLESORT
a=[90,34,19,100,45,20,67]
#print(a)
#a.sort()
#print(a)
for i in range(len(a)):
    #print(a)
    for j in range(len(a)-1) :
       # print(a)
        if a[j]>a[j+1]:
            a[j],a[j+1]=a[j+1],a[j]
            
print(a)            


a=[90,34,19,100,45,20,67]
n=len(a)
for i in range(n):
    smallest=i
    for j in range(n):
        if a[j]==a[smallest]:
            smallest=j
            a[j]=smallest
print(a)            

#SELECTIONSORT
a=[90,34,19,100,45,20,67]
for i in range(len(a)):
    max=i
    for j in range(i+1,len(a)):
        if a[j]<a[max]:
           # max=j
            a[j],a[max]=a[max],a[j]
print(a) 

#INSERTIONSORT
a=[100,34,90,35,12,45,90,50]
for i in range(1,len(a)):
    key=a[i]
    j=i-1
    while j>=0 and key<a[j]:
        a[j+1]=a[j]
        j=j-1
        a[j+1]=key
print(a)
           
        
           