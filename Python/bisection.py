# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 13:56:35 2019

@author: DELL
"""

def F(exp,x):
    return eval(exp)#Defines the function here
    #x*x*x - x*x + 2
    #f=x*x*x - x*x + 2
input_exp=input("f(x)=")
a=eval(input("enter a="))
b=eval(input("enter b="))
    #return f
def bisection(a,b): 
  
    if (F (input_exp,a) * F(input_exp,b) >= 0): 
        print("You have not assumed right a and b\n") 
        return
   
    c = a 
    while ((b-a) >= 0.01): 
  
        # Find middle point 
        c = (a+b)/2
   
        # Check if middle point is root 
        if (F(input_exp,c) == 0.0): 
            break
   
        # Decide the side to repeat the steps 
        if (F(input_exp,c)*F(input_exp,a) < 0): 
            b = c 
        else: 
            a = c 
              
    print("The value of root is : ","%.4f"%c) 

bisection(a,b)