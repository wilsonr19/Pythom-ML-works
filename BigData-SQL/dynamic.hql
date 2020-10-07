use user;

create table std_tb1(stdname string, id int, year int, dept string)
row format delimited fields terminated by ',';

load data local inpath
'/home/cloudera/Desktop/std.txt' into table std_tb1;

select * from std_tb1;

set hive.exec.dynamic.partition.mode=nonstrict;

create external table std_par1(stdname string, id int) 
partitioned by (year int, dept string)
row format delimited fields terminated by ',';

insert into table std_par1 partition(year,dept) select * from std_tb1;

select count(*) from std_tb1;
select count(*) from std_par1;

show create table std_par1;

select * from std_par1 where year=2012 and dept='cs';

drop table std_tb1;
