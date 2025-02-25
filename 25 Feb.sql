-- self join -> part of equi join
-- When a table is match with its own table

use test1;

create table staff(eid int, ename varchar(20), manager_id int);

insert into staff values(10,"sam",null),(11, 'aman',13),
(12,'manav',10),(13,'Heeman',11),(14,'Vineet',12);

select emp.eid, emp.ename, emp.manager_id, mng.ename
from staff as emp join staff as mng
where emp.manager_id = mng.eid;

-- set operator
-- use to combine two column

-- what is diff btn set operator and join
-- union will append the result og the other query
-- in union col name size should match eg 4 col in table

use sakila;

select * from actor where actor_id in (2,3)
union 
select * from actor where actor_id in (3,5);

-- union all
select * from actor where actor_id in (2,3)
union all
select * from actor where actor_id in (3,5);

-- except (minus)
select * from actor where actor_id in (2,3)
except
select * from actor where actor_id in (3,5);

select * from actor; 
describe actor;      -- with decribe we can find which is primary key / Foreign key
select * from film_actor;
describe film_actor;

-- join both table and find which actor did how many movie

select ac.actor_id, ac.first_name, count(f.film_id) as movies
from actor as ac join film_actor as f
where ac.actor_id = f.actor_id
group by ac.actor_id order by movies desc;

-- leaning assign
-- datatypes in SQL
