use sakila;

select * from payment 
where amount > (select amount from payment where rental_id =1185);

-- get those payment where the month matches with the payment id=3 month

select * from payment 
where month(payment_date)= (select month(payment_date) from payment where payment_id = 3);

-- Get those amount where the total no of payments for the amount should be greater 
-- than the total payment of amount 0.99

select amount, count(amount) from payment 
group by amount
having count(amount) > (select count(amount) from payment where amount = 0.99);

-- Ques: Get each customer id and the total amount spend 
-- where the total amt greater than total amt spend by cust 9

select customer_id, sum(amount) from payment 
group by customer_id
having sum(amount) > (select sum(amount) from payment where customer_id = 9);

-- mutli-row subquery
-- IF u have multi-row subquery we cannot use =,>,< etc in condition

-- In mutli-row subquery we use 3 operator
-- in
-- =any , >any, <any    (both in , =any are same but in any we can use >any, <any)
-- >all , <all 

select * from payment
where amount in (select amount from payment where payment_id in (1,3));

select * from payment
where amount =any (select amount from payment where payment_id in (1,3));

-- >any mean we can get value from the min value given
select * from payment
where amount >any (select amount from payment where payment_id in (1,3));

-- <any mean we can get value from the max value given
select * from payment
where amount <any (select amount from payment where payment_id in (1,3));

select * from payment
where amount >all (select amount from payment where payment_id in (1,3));

select * from payment
where amount <all (select amount from payment where payment_id in (1,3));

-- Learning assignment
-- what is co-related subquery
-- what is database
-- what is DBMS
-- type of DBMS with example
-- DBMS VS RDBMS
-- Where vs having caluse
-- What is SQl and type
-- what is keys and types with example
