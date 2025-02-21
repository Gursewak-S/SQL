-- Join
-- sql => 1 or 1 more table join
-- consistency
-- null value naah aaye

-- null value pe koi bi operation perform nhi ho sakta

create database test1;
use test1;

create table product (pid int, name varchar(20), price int);
insert into product values(10,'tv',100),(20,'apple',200),
(30,'mobile',300),(40,'shoe',1500);

select * from product;

create table orders(oid varchar(20), city varchar(20),
product_id int);
insert into orders values('A1012','Jaipur',10),
('B21012','Goa',20), ('C3012','Japan',30),('D4012','uK',60);

select * from orders;

-- Cross/ cartision join (m*n) (in this we didnt define condition then the 1st row match 
-- with all row with order then 2nd row match with all row with order, so on
select pid, name,price, city from product join orders;

select pid, name,price, city from product join orders where pid= product_id;

-- it is better way to solve if give table name with col name
-- equi join
select p.pid, p.name,p.price, o.city 
from product as p join orders as o 
where p.pid= o.product_id;

-- with inner join we only use on (both on and where are same)
select p.pid, p.name,p.price, o.city 
from product as p inner join orders as o 
on p.pid= o.product_id;

-- left join
select p.pid, p.name,p.price, o.city 
from product as p left join orders as o 
on p.pid= o.product_id;

-- right join
select p.pid, p.name,p.price, o.city 
from product as p right join orders as o 
on p.pid= o.product_id;

-- non-equi join (in this we can use any operator =,>,<) but in equi we use only = 
select pid, city 
from product, orders 
where pid= product_id;

insert into orders values('E1152','JK',10),
('F1052','UK',60), ('G3012','MP',30);

select p.pid, p.name,p.price, o.oid, o.city 
from product as p inner join orders as o 
on p.pid= o.product_id;

select p.pid, p.name,p.price, o.oid, o.city 
from product as p left join orders as o 
on p.pid= o.product_id;

select p.pid, p.name,p.price, o.oid, o.city 
from product as p right join orders as o 
on p.pid= o.product_id;

select * from orders;

-- natural join (bakwass join)
-- in natural if there is no common col the its cross join
-- natural if there is common col and value the its inner join
select p.pid, p.name,p.price, o.oid, o.city 
from product as p natural join orders as o;

desc orders;

alter table orders
rename column product_id to pid;
