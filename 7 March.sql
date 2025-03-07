-- Window function : is a special type of function in we perform calculation on a set of records and whatever a result comes we relate with a current row.

-- THese type of calculation we do on specific data and it is known as window
-- we use 'over' to perform window function

use sakila;

create table employees(id int primary key auto_increment, dept varchar(20), salary int);
insert into employees (dept,salary) values("hr", 200),('hr', 300),('hr', 100),
	('marketing', 70),('marketing', 50),('marketing', 200), ('marketing', 400), ('marketing', 200),
    ('marketing', 600),('dsa', 150),('dsa', 120),('dsa', 70),('dsa', 40),('dsa', 90),('dsa', 500);

select * from employees;

select *,
sum(salary) over(),
max(salary) over(),
min(salary) over(),
avg(salary) over()
from employees;

-- window partition by
select *,
sum(salary) over(),
sum(salary) over(partition by dept)
from employees;

-- running sum is cumulative sum **
select *,
sum(salary) over(order by salary)
from employees;

select *,
sum(salary) over(partition by dept order by salary)
from employees;

-- avg slary od each dept running avg of each dept

select *,
avg(salary) over(partition by dept),
avg(salary) over(partition by dept order by salary)
from employees;

-- row_number()
select *,
row_number() over(partition by dept order by salary)
from employees;

-- rank()  -if same kind of value then the ranking are same and the next ranking will skips based on the no of records
select *,
rank() over(order by salary)
from employees;

select *,
rank() over(partition by dept order by salary)
from employees;

-- dense_rank()  : it will not skip ranking values
select *,
rank() over(order by salary),
dense_rank() over(order by salary)
from employees;

-- lag, lead, ntile
select *,
lag(salary) over(order by salary),
lead(salary) over(order by salary),
lead(salary,2) over(order by salary)
from employees;

select *,
ntile(3) over(order by salary)
from employees;

