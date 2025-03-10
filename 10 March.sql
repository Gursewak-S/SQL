-- Using Window function to find the n highest salary

use sakila;

select * from
(select amount,
dense_rank() over(order by amount desc) as rating
from payment) as tab where rating =2;

-- Common table expression 
-- whenever there is an expression like select, update, delete it will store the result temporary
-- we create this 'with' keyword and we can refer multiple time
-- it make the complex logic simpler
-- it will make query readable.

with cte as 
(select amount,
dense_rank() over(order by amount desc) as rating
from payment)
select * from cte;

-- it will create temporary table and whenever we restart the mysql it will remove from memory
create temporary table sam as select * from payment;

select * from sam;

with 
cte1 as (select * from actor where actor_id>2),
cte2 as (select * from film_actor where film_id = 30)
select cte1.actor_id, film_id  from cte1 join cte2
where cte1.actor_id = cte2.actor_id;

-- parameter cte - learning assign

-- recursive cte -- until some condition is satisfied

with recursive num_table
as (select 10 as num
	union
		select num+1 from num_table where num<13)
select * from num_table;

-- get actor_id first name last name from tha table where either the actor id is > then 5 or the name is nick

with recursive name as 
(select actor_id,first_name,concat(first_name,last_name) from actor 
 where actor_id>5 
 union 
 select actor_id,first_name,concat(first_name,last_name) from actor 
 where first_name='nick')
select * from name;

-- Learning assign
-- cte
-- temporary table and views
