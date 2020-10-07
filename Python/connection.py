# -*- coding: utf-8 -*-
"""
Created on Sun Jul 28 16:08:48 2019

@author: DELL
"""

import MySQLdb
conn=MySQLdb.connect(host='localhost',user='root',passwd='1999',db="college") 
print(conn)
cursor = conn.cursor()


cursor.execute('SELECT * FROM department')
cursor.fetchall()
cursor.execute('SELECT * FROM faculty')
cursor.fetchall()
cursor.execute('SELECT * FROM student')
cursor.fetchall()
cursor.execute('SELECT * FROM course')
cursor.fetchall()


cursor.execute('select * from student where regno=1001')
cursor.fetchall()
cursor.execute('update department set deptname =computer where deptid=112')
cursor.fetchall()
cursor.execute('select regno,sname,age from student order by deptid')
cursor.fetchall()
#cursor.execute("insert into student values(23,'dhanya',22,'#4 main',980765432,'d@gmail.com',115,16)")
#cursor.insert_query()
#sql="INSERT INTO department (deptid,deptname) VALUES (%s,%s)"
#val=("1117","E-com")
#cursor.execute(sql,val)
#conn.commit()
#print(cursor.rowcount, "record inserted.")


cursor.execute('select d.deptid,d.deptname,s.sname from department d inner join student s on d.deptid=s.deptid')
cursor.fetchall()
cursor.execute('select f.fid,f.fname,f.qualification,s.sname,s.address from faculty f right join student s on f.fid=s.fid')
cursor.fetchall()
cursor.execute('select department.deptid,deptname,faculty.fname,qualification,student.sname,course.cname from((((department inner join faculty on department.deptid=faculty.deptid)inner join student on department.deptid=student.deptid)inner join course on department.deptid=course.deptid))')
cursor.fetchall()

x=int(input("enyer a value:"))
y=input("enter a value:")
row=(x,y)
sql="INSERT INTO department (deptid,deptname) VALUES(%s,%s)"
#print(sql)
conn.commit();
cursor.execute(sql,row)


a=int(input("enter course id:"))
b=input("enter course name:")
#c=int(input("enter deptid:"))
#d=int(input("enter fid:"))
#e=int(input("enter regno:"))
n1=100
n2=1
n3=1001
rocky=(a,b,n1,n2,n3)
msql="INSERT INTO course (cid,cname,deptid,fid,regno) VALUES(%s,%s,%s,%s,%s)"
cursor.execute(msql,rocky)
conn.commit()




deptid=int(input("Enter dept id:"))
cursor.execute("select department.deptid,course.cid,cname from department inner join course on %d=course.deptid"%deptid) 
for row in cursor:
      print(row)
#one=int(input("enter a deptid:"))
#rint("given data is",one)
#cursor.execute("select department.deptid,course.cid,cname from department inner join course on %d=course.deptid"%one) 
#for row in cursor:
 # if row is None:
  #    print("NO MATCHING DATA")
  #else:
   #   print(row)
deptid=int(input("Enter dept id:"))
cursor.execute("select department.deptid,course.cid,cname from department inner join course on department.deptid=%d"%deptid) 
for row in cursor:
      print(row)
  
i=int(input("enter an id:"))
cursor.execute('select department.deptid,deptname,course.cid,cname from department inner join course on department.deptid=course.deptid where department.deptid=%d'%i)
for ent in cursor:
    print(ent)
#cursor.fetchall()
#conn.commit()
    
qu=int(input("enter an id:"))
cursor.execute('select department.deptid,deptname,regno,sname,phoneno from department inner join student on department.deptid=student.deptid where department.deptid=%d'%qu)
for i in cursor:
    print(i)
conn.commit()    

rock=int(input("enter an value:"))
cursor.execute('select department.deptid,deptname,regno,sname,phoneno from department inner join student on department.deptid=%d'%rock)
conn.commit()
for j in cursor:
    print(j)
    
win=int(input("enter an regno:"))
cursor.execute('select student.regno,sname,age,email,course.cname from student inner join course on student.regno=%d'%win)
conn.commit()
for k in cursor:
    print(k)
    
wow=int(input("enter an regno:"))
cursor.execute('select student.regno,sname,age,email,course.cname from student inner join course on student.regno=course.regno where student.regno=%d'%wow)
conn.commit()
for r in cursor:
    print(r) 
    
w=int(input("enter a value:"))
cursor.execute('select faculty.fid,student.sname,email from faculty inner join student on faculty.fid=student.fid where faculty.fid=%d'%w)
for fa in cursor:
    conn.commit()
    print(fa)