create database ORDER1;
use ORDER1;

create table customer(
cname char(10),
cno int(10) primary key,
city char(10)
);

create table order1(
ono int(10) primary key,
oamt float(10),
cno int(10),
foreign key(cno) references customer(cno)
);

create table item(
itemno varchar(15) primary key,
uniqueprice int(10)
);

create table oitem(
ono int(10),
itemno varchar(15),
quantity int(10),
foreign key(ono) references order1(ono),
foreign key(itemno) references item(itemno)
);

create table warehouse(
whno varchar(10) primary key,
city char(20)
);

create table shipment(
ono int(10),
whno varchar(10),
shipdate date,
foreign key(ono) references order1(ono),
foreign key(whno) references warehouse(whno)
);

alter table shipment drop column shipdate;

describe order1;
describe item;
describe oitem;
describe customer;
describe warehouse;
describe shipment;

insert into customer values("robin",100,"hassan");
insert into customer values("revanth",101,"bangalore");
insert into customer values("sandesh",103,"pune");

select * from customer;

insert into order1 values(1,3000,100);
insert into order1 values(18,4000,101);
insert into order1 values(11,2400,103);

select * from order1; 

insert into item values(10,4200);
 insert into item values(20,2340);
insert into item values(30,5600);

select * from item;

insert into oitem values(1,10,50);
insert into oitem values(18,20,4);
insert into oitem values(11,30,23);

select * from oitem;

insert into warehouse values(15,"bangalore");
insert into warehouse values(25,"delhi");
insert into warehouse values(18,"hyderabad");

select * from warehouse;

insert into shipment values(1,15);
insert into shipment values(18,25);
insert into shipment values(11,18);

select * from shipment;

select ono from shipment where whno=18;