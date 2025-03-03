use sakila;

select distinct(amount) from payment
order by amount desc limit 2;

-- limit skip_value, total_value you want to print
select distinct(amount) from payment
order by amount desc limit 1,1;


-- Find 2nd maximum amount
select max(amount) from payment
where amount < (select max(amount) from payment);

-- DDL statement (Data definition language)
-- with data, create, drop, alter

-- DML -> insert, update, delete

create database march3;
use march3;

create table regex(id int, name varchar(20));
insert into regex values(1,"sam");
insert into regex(name) values("Amrit");
insert into regex(name) values(null);
select * from regex;

-- ctas
create table y2 as select * from sakila.actor;
select * from y2;

-- using this only data will copy not constraints
create table y3 as select actor_id, first_name from sakila.actor;
select * from y3;
desc y3;

create table y4 as select actor_id as actor, first_name as name1 from sakila.actor;
select * from y4;

-- delete
select * from y3;

delete from y3 where actor_id in (2,4);

-- update
update y3 set first_name = "regex";
select * from y3;

-- Drop => Delete all data and table also
Drop table y3;
select * from y3;

-- truncate -> Delete all data but structure remain same
truncate table y4;
select * from y4;

-- difference b/e delete drop and truncate
-- delete --> delete one or more rows based on the condition -- dml -- delete is very slower 
-- truncate --> delete all the rows -- ddl -- truncate is extremely faster then drop an delete
--  drop --> delete the tables -- ddl -- drop is faster then delete but slower then truncate
-- delete and truncate doesn't affect the table structure where drop affect the table structure
-- truncate delete the old table and recreate the new table with same structure
-- delete can be roll backed means we can undo the task where as drop and truncate can't be roll backed

create table companies(id int);
insert into companies values(10);
select * from companies;

desc companies;

-- add table columns
alter table companies
add column phone varchar(15);

select * from companies;
desc companies;

alter table companies
add column employee_count int not null;

select * from companies; 

-- ALTER TABLE - DROP COLUMN
alter table companies
drop column employee_count;

select * from companies; 

-- rename table
rename table companies to newcompany;
select * from newcompany;

-- ALTER TABLE - RENAME table
alter table newcompany rename to companies;
select * from companies;

-- rename column name
alter table companies
rename column phone to company_name;

select * from companies;

-- assigning primary key to column 
alter table companies add primary key (id); 

desc companies;

alter table companies
add constraint regex_company_uk unique(company_name);

alter table companies drop constraint regex_company_uk;

-- in modify if we are changing varchar to int and if values are present inside that
-- then we have to make value inside null or add integer value first

alter table companies modify company_name int;
desc companies;
