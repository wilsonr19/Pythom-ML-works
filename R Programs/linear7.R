#1
CM=matrix(c(2,1,1,1,1,0),3,2,byrow=T)
D=c("<=","<=","<=")
O=c(3,2)
R=c(100,80,40)
library(lpSolve)
lp("max",O,CM,D,R)
lp("max",O,CM,D,R)$solution

#2
AM=matrix(c(8,6,1,4,2,1.5,2,1.5,0,0,1,0),4,3,byrow=T)
d=c("<=","<=","<=","<=")
o=c(-60,-30,-20)
r=c(48,20,8,5)
library(lpSolve)
lp("max",o,AM,d,r)
lp("max",o,AM,d,r)$solution

#3
R=matrix(c(2,1,3,4,4,7),3,2,byrow=T)
s=c("<=","<=","<=")
t=c(-60,-70)
e=c(300,509,812)
library(lpSolve)
lp("max",t,R,s,e)
lp("max",t,R,s,e)$solution

#4
x=matrix(c(400,200,150,500,3,4,0,0,2,2,4,4,2,4,1,5),4,4,byrow=T)
s=c("<=","<=","<=","<=")
t=c(50,20,30,80)
e=c(500,6,10,8)
library(lpSolve)
lp("max",t,x,s,e)
lp("max",t,x,s,e)$solution

#5
w=matrix(c(0.3,0.3,0.17,0.4,0.3,0.17),2,3,byrow=T)
s=c("<=","<=")
t=c(1.90,2.10)
e=c(9,9)
library(lpSolve)
lp("max",t,w,s,e)
lp("max",t,w,s,e)$solution

#6
q=matrix(c(-2,5,3,8,2,-5,0,0,10,10,0,-2),4,3,byrow=T)
s=c("<=","<=","<=","<=")
t=c(1000,1000,1000)
e=c(100000,200000,50000)
library(lpSolve)
lp("max",t,q,s,e)
lp("max",t,q,s,e)$solution

#7
a=matrix(c(1,2,3/2,2/3,2/3,1,1/2,1/2,1/3),3,3,byrow=T)
s=c("<=","<=","<=")
t=c(11,16,15)
e=c(12000,4600,2400)
library(lpSolve)
lp("max",t,a,s,e)
lp("max",t,a,s,e)$solution

#8
p=matrix(c(0.09,0.02,0.60,0.90),2,2,byrow=T)
s=c(">=",">=")
t=c(240,40)
e=c(0.30,0.90)
library(lpSolve)
lp("min",t,p,s,e)
lp("min",t,p,s,e)$solution