use sakila;

select amount, sum(amount) from payment
where amount !=0.99
group by amount having sum(amount)>8000;

-- having can use physical col and aggregate func


-- alias
select amount, amount*10 as new from payment;

-- if we want to name a col that is already a pre-define func, the we use ``(below esc key) 
select amount, amount*10 as `select` from payment;

-- order by
select * from payment
order by amount;

select * from payment
order by amount desc, rental_id desc;

-- Control Flow functions
-- condition?True:False
select amount,
if(amount=0.99,'Correct', 'Incorrect')
from payment;

select amount,
if(amount=0.99,'Correct', 
	if(amount=2.99,'yes','Incorrect'))
from payment;

-- case statement

/*
select col,
  case
    when condition then statement
    when condition then statement
  end
*/

select amount,
case
	when amount = 0.99 then 'Correct'
    when amount = 2.99 then 'Yes'
    else amou
end as con
from payment;

-- Ques: Get payment table, if the count of payment done for each amount is greater than 10000
		--  then print amount has greater else less than

select amount,
case
	when count(amount) > 1000 then 'greater than 1000'
    else 'Less than 1000'
end as Count
from payment
group by amount;

-- Ques: if the amount is greater than 1, 3, 7 other less than 1

select amount,
case
	when amount>1 and amount<3 then 'greater than 1'
    when amount>3 and amount<7 then 'greater than 3'
    when amount > 7 then 'greater than 7'
    else 'Less than 1'
end as total
from payment;

-- subquery
-- query within a query

select * from payment 
where amount =(select amount from payment where payment_id=3);


-- Learning assignment
-- 1. what are keys and its usuage
-- 2. type of relationship in SQL
-- 3. primary key, candidate key, super, foreign key




