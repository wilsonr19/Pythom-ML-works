create database Assignment;

use Assignment;

create table bucket_partition(first_name varchar(64), last_name varchar(64), address string, country varchar(64), city varchar(64), state varchar(64), post string, phone1 varchar(64), phone2 string, email string, web string)
row format delimited fields terminated by ','
tblproperties("skip.header.line.count"="1");

load data local inpath '/home/cloudera/Desktop/buckets_data.csv' into table bucket_partition;

select * from bucket_partition limit 5;

set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions=1000; 
set hive.exec.max.dynamic.partitions.pernode=250;
set hive.enforce.bucketing=true;

create external table final_bucket(first_name varchar(64), last_name varchar(64), address string, city varchar(64), state varchar(64), post string, phone1 varchar(64), phone2 string, email string, web string) partitioned by(country varchar(64)) clustered by(state) sorted by (city) into 5 buckets
row format delimited fields terminated by ',';


insert overwrite table final_bucket partition(country) select first_name,last_name,address,city,state,post,phone1,phone2,email,web,country from bucket_partition;



select * from final_bucket limit 5;

drop table bucket_partition;