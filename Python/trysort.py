# -*- coding: utf-8 -*-
"""
Created on Fri Aug 23 08:59:47 2019

@author: DELL
"""
a=[]
robi=open('C:/Users/DELL/Downloads/rob.csv','r')
r=robi.readlines()
#print(r)
data=int(input("enter a row:"))
rocky=r[data].rstrip("\n").split(",")
#for n in range(len(rocky)):
 #   rocky[n]=eval(rocky[n])
#print(rocky)    
integer=[] 
floatt=[]
string=[]
for data in range(len(rocky)):
    try:
        try:
            if(int(rocky[data])):
                integer.append(rocky[data])
        except:
            if(float(rocky[data])):
                floatt.append(rocky[data])
    except:
        string.append(rocky[data])
print("the integer values are:",integer)
print("the float values are:",floatt)
print("the strings values are:",string)
#b="bubblesort"
#i="insertionsort"
#bubblesort=[]
#insertionsort=[]


d=input("enter type of sort:")
a.append(rocky[0])
a.append(rocky[2])
rocky.remove(rocky[0])
rocky.remove(rocky[1])
for k in range(len(rocky)):
    rocky[k]=eval(rocky[k])
if(d=="bubblesort"):
    def bubbleSort(rocky):
        for passnum in range(len(rocky)):
            for i in range(len(rocky)-passnum-1):
                if rocky[i]>rocky[i+1]:
                    rocky[i],rocky[i+1]=rocky[i+1],rocky[i]
    bubbleSort(rocky)
    print(rocky)
elif d=="selectionsort":
    def selectionSort(rocky):
        for fillslot in range(0,len(rocky)-1):
            maxpos=fillslot
            for location in range(fillslot+1,len(rocky)):
                if rocky[location]<rocky[maxpos]:
                    #maxpos = location
                    rocky[location],rocky[maxpos]=rocky[maxpos],rocky[location]
    selectionSort(rocky)
    print(rocky)
elif(d=="mergesort"):
    def mergeSort(rocky):
        print("Splitting ",rocky)
        if len(rocky)>1:
            mid = len(rocky)//2
            lefthalf = rocky[:mid]
            righthalf = rocky[mid:]

            mergeSort(lefthalf)
            mergeSort(righthalf)
            i=j=k=0       
            while i < len(lefthalf) and j < len(righthalf):
                if lefthalf[i] < righthalf[j]:
                    rocky[k]=lefthalf[i]
                    i=i+1
                else:
                    rocky[k]=righthalf[j]
                    j=j+1
                    k=k+1

            while i < len(lefthalf):
                rocky[k]=lefthalf[i]
                i=i+1
                k=k+1

            while j < len(righthalf):
                rocky[k]=righthalf[j]
                j=j+1
                k=k+1
        print("Merging ",rocky)
    mergeSort(rocky)
    print(rocky)
elif(d=="insertionsort"):
    def insertionSort(rocky):
        for index in range(1,len(rocky)):
            
            currentvalue = rocky[index]
            position = index
            
            while position>0 and rocky[position-1]>currentvalue:
                rocky[position]=rocky[position-1]
                position = position-1
                
                rocky[position]=currentvalue

    insertionSort(rocky)
    print(rocky)
elif(d=="quicksort"):
    def quickSort(rocky):
        quickSortHlp(rocky,0,len(rocky)-1)

    def quickSortHlp(rocky,first,last):
        if first < last:

            splitpoint = partition(rocky,first,last)
            
            quickSortHlp(rocky,first,splitpoint-1)
            quickSortHlp(rocky,splitpoint+1,last)


    def partition(rocky,first,last):
        pivotvalue = rocky[first]
        leftmark = first+1
        rightmark = last
        done = False
        while not done:

           while leftmark <= rightmark and rocky[leftmark] <= pivotvalue:
               leftmark = leftmark + 1

           while rocky[rightmark] >= pivotvalue and rightmark >= leftmark:
               rightmark = rightmark -1

           if rightmark < leftmark:
               done = True
           else:
                temp = rocky[leftmark]
                rocky[leftmark] = rocky[rightmark]
                rocky[rightmark] = temp
           temp = rocky[first]
           rocky[first] = rocky[rightmark]
           rocky[rightmark] = temp
        return rightmark
    quickSort(rocky)
    print(rocky)
else:
    print(rocky)
     