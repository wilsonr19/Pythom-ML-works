create database college;
use  college;

create table department(
deptid  int(10) primary key,
deptname char(10)
);

create table faculty(
fid int(10) primary key,
fname char(10),
age int(5),
address varchar(35),
phoneno int(10),
qualification char(10),
deptid int(10),
foreign key(deptid) references department(deptid)
);
delete phoneno from faculty;
alter table faculty modify phoneno int(15);

create table student(
regno int(10) primary key,
sname char(10),
age int(5),
address varchar(35),
phoneno int(10),
email varchar(15),
deptid int(10),
fid int(10),
foreign key(deptid) references department(deptid),
foreign key(fid) references faculty(fid)
);

create table course(
cid int(10) primary key,
cname char(10),
deptid int(10),
fid int(10),
regno int(10),
foreign key(deptid) references department(deptid),
foreign key(fid) references faculty(fid),
foreign key(regno) references student(regno)
);

describe department;
desc faculty;
describe student;
desc course;

insert into department values(100,'kannada');
insert into department values(101,'Maths');
insert into department values(102,'Stats');
insert into department values(103,'Hindi');
insert into department values(104,'English');
insert into department values(105,'Biology');
insert into department values(106,'Chemistry');
insert into department values(107,'Physics');
insert into department values(108,'Botony');
insert into department values(109,'BigData');
insert into department values(110,'History');
insert into department values(111,'Economics');
insert into department values(112,'comp sc');
insert into department values(113,'political');
insert into department values(114,'Business');
insert into department values(115,'Arts');

insert into faculty values(1,'yathish',27,'#35 1stmain',908767564,'MCA',100);
insert into faculty values(2,'mahesh',28,'#5 2ndmain',908457564,'MCA',101);
insert into faculty values(3,'Anand',27,'#9 3rd cross',908907564,'Msc',102);
insert into faculty values(4,'Raghu',26,'3rd main nlo',738767564,'MA',103);
insert into faculty values(5,'Rony',37,'#4 4thmain',788767564,'Mphil',104);
insert into faculty values(6,'Pavan',27,'#5 1stmain',898767564,'MBA',105);
insert into faculty values(7,'Poornima',51,'#5 1st cross',780767564,'Msc',106);
insert into faculty values(8,'Shweta',50,'#90 jpnagar',905667564,'Mtech',107);
insert into faculty values(9,'Priya',36,'#1st cross',903467564,'Msc phd',108);
insert into faculty values(10,'Roopa',46,'#45 jayanagar',898767564,'MA phd',109);
insert into faculty values(11,'Shilpa',45,'#6 6th cross',638767564,'MBA mphil',110);
insert into faculty values(12,'Ravi',34,'#7 7th main',634767564,'MCA',111);
insert into faculty values(13,'Mohan',27,'#1 banashankari',963767564,'Msc mphil',112);
insert into faculty values(14,'Manohar',54,'#345 sadashivnagar',812767564,'MBA',113);
insert into faculty values(15,'Mani',45,'#56 bel nagar',612767564,'Mtech',114);
insert into faculty values(16,'Manohar',36,'#56 1st main',706543562,'Msc',115);

insert into student values(1001,'robin',20,'#41 1st cross',890786543,'rocky@gmail.com',100,1);
insert into  student values(1002,'revanth',22,'#344 kodigehalli',708967543,'revan@gmail.com',101,2);
insert into student values(1003,'sandesh',22,'#10 vijaynagar',890765341,'sandy@gmail.com',102,3);
insert into student values(1004,'rocky',23,'#45 1st main',789056532,'rooc@yahoo.com',103,4);
insert into student values(1005,'shruthi',22,'#5 1st main',789356532,'shu@yahoo.com',104,5);
insert into student values(1006,'ramya',20,'#45 1st main',778056532,'ramya@gmail.com',105,6);
insert into student values(1007,'precilla',19,'#45 1st main',689056532,'preci@yahoo.com',106,7);
insert into student values(1008,'wali',21,'#45 1st main',789346532,'wali@yahoo.com',107,8);
insert into student values(1009,'charan',20,'#45 1st main',712056532,'charan@yahoo.com',108,9);
insert into student values(1010,'sai',20,'#45 1st main',789043532,'sai@gmail.com',109,10);
insert into student values(1011,'santhosh',25,'#45 1st main',989056532,'sant@yahoo.com',110,11);
insert into student values(1012,'sagar',23,'#45 1st main',789156532,'sagu@gmail.com',111,12);
insert into student values(1013,'shivu',21,'#45 1st main',782356532,'shivu@gmail.com',112,13);
insert into student values(1014,'junjin',20,'#45 1st main',812056532,'jun@yahoo.com',113,14);
insert into student values(1015,'loosy',22,'#4 1st main',989056532,'loosy@yahoo.com',114,15);


insert into course values(11,'BCA',100,1,1001);
insert into course values(12,'Bsc',101,2,1002);
insert into course values(13,'BA',102,3,1003);
insert into course values(14,'Msc',103,4,1004);
insert into course values(15,'BE',104,5,1005);
insert into course values(16,'MBA',105,6,1006);
insert into course values(17,'Bcom',106,7,1007);
insert into course values(18,'BBA',107,8,1008);
insert into course values(19,'Mcom',108,9,1009);
insert into course values(20,'Bsc(m)',109,10,1010);
insert into course values(21,'Mtech',110,11,1011);
insert into course values(22,'BHM',111,12,1012);
insert into course values(23,'BSC(F)',112,13,1013);
insert into course values(24,'MA',113,14,1014);
insert into course values(25,'MCA',114,15,1015);

select * from department;
select * from faculty;
select * from student;
select * from course;
select * from student where regno=1001;

select department.deptid,deptname,student.sname from department,student where department.deptid=student.deptid;
select d.deptid,d.deptname,s.sname from department d inner join student s on d.deptid=s.deptid;
select d.deptid,d.deptname,c.cname from department d left join course c on d.deptid=c.deptid;
select f.fid,f.fname,f.qualification,s.sname,s.address from faculty f right join student s on f.fid=s.fid;
select s.regno,s.sname,s.age,s.email,c.cname from student s inner join course c on s.regno=c.regno;
select d.deptid,d.deptname,s.sname,s.phoneno from department d inner join student s  on d.deptid=s.deptid;

update department set deptname ='computer' where deptid=112;
delete from department where deptid=3000;
delete from department where deptid=1000;
delete from department where deptid=3001;
delete from department where deptid=5000;

select deptid,deptname from department where deptid=100;
select deptid,deptname from department;
select regno,sname,phoneno from student;
select distinct sname from student;
select * from faculty where fname='Ravi' and age=34;
select * from student where age=20 or age=27;
select * from student order by age,phoneno;
select * from course order by cname;
select department.deptid,deptname,faculty.fname,qualification,student.sname,course.cname from((((department inner join faculty on department.deptid=faculty.deptid)
inner join student on department.deptid=student.deptid)
inner join course on department.deptid=course.deptid));

select deptname=(select sname,age from student where regno=1008) from department where deptid=100;
select deptid,deptname from department 
where deptid in 
(select cname from course where deptid=105);
select cname,cid from course  where deptid=100;
select regno,sname,age from student order by deptid;
select department.deptid,deptname,course.cid,cname from department inner join course on department.deptid=course.deptid
where department.deptid=110;

select department.deptid,deptname,regno,sname,phoneno from department inner join student on department.deptid=student.deptid
where department.deptid=115;
select student.regno,sname,age,email,course.cname from student inner join course on student.regno=course.regno
where student.regno=1001;

select faculty.fid,student.sname,email from faculty inner join student on faculty.fid=student.fid where faculty.fid=10;