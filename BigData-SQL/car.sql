create database E;
use E;
create table person(
pid int(10) primary key,
pname char(10),
address varchar(25)
);
alter table person modify pname char(15);
desc person;
create table car(
carid int(10) primary key,
model char(10) not null,
myear date
);
alter table car drop column myear;
alter table car add myear int(10);
desc car;

create table accident(
repno int(10) primary key,
accdate date,
loc char(20)
);

alter table accident drop column accdate;
alter table accident add accdate int(10);
desc accident;

create table owns(
oid int(10),
ono int(10),
foreign key(oid) references person(pid),
foreign key(ono) references car(carid)
);

create table participated(
pid int(10),
pno int(10),
prepno int(10),
foreign key(pid) references person(pid),
foreign key(pno) references car(carid),
foreign key(prepno) references accident(repno)
);

alter table participated add damageamt int(10);
desc participated;

insert into person values(1,"ro","43er");
insert into person values(2,"re","4rr");
insert into person values(3,"o","43");

insert into car values(10,"bmw",1990);
insert into car values(11,"benz",1290);
insert into car values(13,"audi",2010);
select * from car;

insert into accident values(11,"agara",2000);
  insert into accident values(12,"aro",2010);
insert into accident values(13,"magadi",1900);

insert into owns values(1,10);
insert into owns values(2,12);
insert into owns values(3,13);

insert into participated values(1,10,11,5000);
insert into participated values(2,12,12,50000);
insert into participated values(3,11,13,1000);
select * from participated;


update participated set damageamt=200 where pno=10 and prepno=11;
insert into accident values(100,"california",2018);
select * from accident;
select count(*) from accident where accdate between 1990 and 2018;
select count(*) from car c,participated p where c.carid=p.pno;
select c.carid,c.model from car c right join participated p on c.carid=p.pno;




create table product(
pid int(10) primary key,
price int(20)
);

desc product;


insert into product values(1,200);
insert into product values(2,300);
insert into product(price) values(400);


select * from product;

alter table product add ppo int(10);
update product set price=20 where pid=2;
select min(price) from product;

select * from 


