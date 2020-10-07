# the student data
Rahul,10,2011,cs
Reema,11,2011,is
Gani,12,2011,ec
alif ali,13,2012,cs
Virat,14,2012,is
Dhoni,15,2012,ec
abhinav,16,2011,cs
Anand vibhav,17,2013,cs
Bheem Mahir,18,2013,ec
Bhavani sharma,19,2013,is


# Data Base
create database user;

show databases;

# Used the DataBase
use database;

# created temporary table
create table std_tb(stdname string, id int, year int, dept string)
row format delimited fields terminated by ',';

# loaded the data
load data local inpath
'/home/cloudera/Desktop/std.txt' into table std_tb;

select * from std_tb;

# set the hive dynamic partition
set hive.exec.dynamic.partition.mode=nonstrict;

# created external table
create external table std_par(stdname string, id int)
partitioned by (year int, dept string)
row format delimited fields terminated by ',';

# inserted data to external table from temporary table
insert into std_par partition(year,dept) select * from std_tb;

# checking whether data is exist or not
select count(*) from std_tb;
select count(*) from std_par;

# checking for location
show create table std_par;

# Reading the data
hadoop fs -cat /user/hive/warehouse/user.db/std_par/year=2011/dept=cs/000000_0


# checking for data
select * from std_par where year=2012 and dept='cs';


# finally droping the temporary table 
drop table std_tb;






