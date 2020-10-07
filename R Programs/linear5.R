#1
a=c(2,0,0,-1,3,3,6,-6,-6)
a
a1=matrix(a,3,3,byrow=T)
a1
E=eigen(a1)
ec=E$values
ec
E
p=prod(ec)
p
d=det(a1)
d
s=sum(diag(a1))
s
s1=sum(ec)
s1
p==d
s==s1
if(all(ec<=0) & any(ec==0))
cat("negative semidefinite")else
if(all(ec<0))
cat("negative definite")else
if(all(ec>=0))
cat("positive semidefinite")else
if(all(ec>0))
cat("positive definite")else
cat("indefinite")


#2
b=c(0,1,2,-4,1,4,-5,1,7)
b
b1=matrix(b,3,3,byrow=T)
b1
E=eigen(b1)
ec=E$values
ec
E
p=prod(ec)
p
d=det(b1)
d
s=sum(diag(b1))
s
s1=sum(ec)
s1
p==d
s==s1

if(all(ec<=0) & any(ec==0))
cat("negative semidefinite")else
if(all(ec<0))
cat("negative definite")else
if(all(ec>=0))
cat("positive semidefinite")else
if(all(ec>0))
cat("positive definite")else
cat("indefinite")

#3
c=c(4,1,3,1,3,1,2,0,5)
c
c1=matrix(c,3,3,byrow=T)
c1
E=eigen(c1)
ec=E$values
ec
E
p=prod(ec)
p
d=det(c1)
d
s=sum(diag(c1))
s
s1=sum(ec)
s1
p==d
s==s1

if(all(ec<=0) & any(ec==0))
cat("negative semidefinite")else
if(all(ec<0))
cat("negative definite")else
if(all(ec>=0))
cat("positive semidefinite")else
if(all(ec>0))
cat("positive definite")else
cat("indefinite")

#4
d=c(3,4,-1,1,3,4,-2,1,6,7,-1,9,0,1,5,1,6,1,-8,4,3,7,5,4,-8)
d
d1=matrix(d,5,5,byrow=T)
d1
E=eigen(d1)
ec=E$values
ec
E
p=prod(ec)
p
d=det(d1)
d
s=sum(diag(d1))
s
s1=sum(ec)
s1
p==d
s==s1

if(all(ec<=0) & any(ec==0))
cat("negative semidefinite")else
if(all(ec<0))
cat("negative definite")else
if(all(ec>=0))
cat("positive semidefinite")else
if(all(ec>0))
cat("positive definite")else
cat("indefinite")


#5
e=c(1,4,0,0,0,2,0,0,5,3,1,1,4,7,2,2)
e
e1=matrix(e,4,4,byrow=T)
e1
E=eigen(e1)
ec=E$values
ec
E
p=prod(ec)
p
d=det(e1)
d
s=sum(diag(e1))
s
s1=sum(ec)
s1
p==d
s==s1

if(all(ec<=0) & any(ec==0))
cat("negative semidefinite")else
if(all(ec<0))
cat("negative definite")else
if(all(ec>=0))
cat("positive semidefinite")else
if(all(ec>0))
cat("positive definite")else
cat("indefinite")


#6
g=matrix(c(8,-2,-2,5),2,2,byrow=T)
g
E=eigen(g)
ec=E$values
ec
R=qr(g)$rank
R
d=det(g)
d
p=prod(ec)
p
d==p

if(all(d<=0) & any(d==0))
cat("negative semidefinite")else
if(all(d<0))
cat("negative definite")else
if(all(d>=0))
cat("positive semidefinite")else
if(all(d>0))
cat("positive definite")else
cat("indefinite")

#7
h=matrix(c(1,-2,4,-2,2,0,4,4,-7),3,3,byrow=T)
h
E=eigen(h)
ec=E$values
ec
R=qr(h)$rank
R
d=det(h)
d
p=prod(ec)
p
d==p

if(all(d<=0) & any(d==0))
cat("negative semidefinite")else
if(all(d<0))
cat("negative definite")else
if(all(d>=0))
cat("positive semidefinite")else
if(all(d>0))
cat("positive definite")else
cat("indefinite")

#8
I=matrix(c(3,-1,0,-1,2,-1,0,-1,3),3,3,byrow=T)
I
E=eigen(I)
ec=E$values
ec
R=qr(I)$rank
R
d=det(I)
d
p=prod(ec)
p
d==p

if(all(d<=0) & any(d==0))
cat("negative semidefinite")else
if(all(d<0))
cat("negative definite")else
if(all(d>=0))
cat("positive semidefinite")else
if(all(d>0))
cat("positive definite")else
cat("indefinite")

#9
j=matrix(c(9,8,3,0,3,2,7,5,8,7,4,1,0,5,1,0),4,4,byrow=T)
j
E=eigen(j)
ec=E$values
ec
R=qr(j)$rank
R
d=det(j)
d
p=prod(ec)
p
d==p

if(all(d<=0) & any(d==0))
cat("negative semidefinite")else
if(all(d<0))
cat("negative definite")else
if(all(d>=0))
cat("positive semidefinite")else
if(all(d>0))
cat("positive definite")else
cat("indefinite")

#10
k=matrix(c(-1,1,10,1,2,0,1,-1,0,2,4,5,-10,0,-2,0,5,6,1,2,0,4,3,0,2,4,5,3,7,7,0,5,6,0,7,8),6,6,byrow=T)
k
E=eigen(k)
ec=E$values
ec
R=qr(k)$rank
R
d=det(k)
d
p=prod(ec)
p
d==p

if(all(d<=0) & any(d==0))
cat("negative semidefinite")else
if(all(d<0))
cat("negative definite")else
if(all(d>=0))
cat("positive semidefinite")else
if(all(d>0))
cat("positive definite")else
cat("indefinite")