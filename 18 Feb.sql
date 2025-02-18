-- multi row function
-- aggregate function

use sakila;

select sum(amount) from payment;
select count(amount) from payment;
select avg(amount), sum(amount)/count(amount) from payment;

select distinct(amount) from payment;

select count(distinct(amount)), count(amount) from payment;

-- if value is not present into column Count will not count that
select count(amount) from payment 
where amount = 0.99;

-- group by

-- you cant choose any other coloum except the col you are using
select amount, count(amount), sum(amount), avg(amount) from payment group by amount;

select payment_id, amount, month(payment_date) from payment;

select month(payment_date), sum(amount) from payment group by month(payment_date);


select * from payment;

-- Ques: Get the total amt and avg amt spend by each customer
select customer_id, sum(amount), avg(amount) from payment group by customer_id;

-- Ques: Get the total amt and the max and min amt for each staff id
select staff_id,  sum(amount), max(amount), min(amount) from payment group by staff_id;

-- Ques: Get tht total no of payment done by each staff
select staff_id, sum(payment_id) from payment group by staff_id;

-- Ques: Get the total amout, total no of entry, the avh amt and the max amt by each cust where amt value > 2 and payment_id > 10
select customer_id, count(amount), sum(amount), avg(amount), max(amount), min(amount) from payment where amount>2 and payment_id > 10 group by customer_id ;

--  * if we use use aggreate function with group by we can only use having as Sum(amount) is not present in table colmn
--  * if that colm is available in that table then we can use where 


