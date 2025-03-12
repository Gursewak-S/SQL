-- Revision

use sakila;

select * from payment;

select amount,sum(amount) from payment group by amount;

-- windows => aggregate functions apply to all rows

select payment_id, amount,
sum(amount) over(partition by amount order by amount) from payment where payment_id<10;

use regex1;


create table user12(cust_id int, cust_name varchar(20)); 
create table order121(order_id int, ord_cust_id int, price int);

-- find out the customer id and total no of order placed
-- we need to identify cust name and id who has place more than 1 order

insert into user12 values(10,'sam'), (11, 'Amrit'),(12,'Manav');
insert into order121 values(1,10,500), (2, 10, 2000),(3, 12, 400);

select c.cust_id, count(o.ord_cust_id) from user12 as c
left join order121 as o
on c.cust_id =  o.ord_cust_id
group by cust_id;

select cust_id, cust_name from user12 as c where 
	(select count(o.order_id) as total_order from order121 as o where c.cust_id=o.ord_cust_id group by c.cust_id)>1;