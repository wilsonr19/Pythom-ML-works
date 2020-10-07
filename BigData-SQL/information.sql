create database information;
use information;

create table department(
deptid int(10) primary key,
deptname char(10),
fid int(10),
numofteachers int(10),
numofcourses int(10)
);
alter table department add foreign key(fid) references faculty(fid);

create table faculty(
fid int(10) primary key,
fname char(20),
phoneno int(15),
qualification char(15),
deptid int(10),
foreign key(deptid) references department(deptid)
);

create table student(
sid int(10) primary key,
sname char(15),
fid int(10),
deptid int(10),
cid int(10),
foreign key(fid) references faculty(fid),
foreign key(deptid) references department(deptid),
foreign key(cid) references course(cid)
);

create table course(
cid int(10) primary key,
cname char(20),
fid int(10),
deptid int(10),
foreign key(fid) references faculty(fid),
foreign key(deptid) references department(deptid)
);
desc department;

create table attendence(
aid int(10) primary key,
totalclass int(15),
totalattend int(15),
sid int(10),
foreign key(sid) references student(sid)
);
