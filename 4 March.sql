use regex1;

show tables;
drop table emp_family;
create table emp(eid int primary key, name varchar(20));
insert into emp values(1,"aman"),(2,"shubham"),(3, "abc");
select * from emp;

create table emp_family(eid int , name varchar(20), father varchar(20));
insert into emp_family values(1,"aman", "raj"),(2,"shubham", "kamal"),(3, "abc", "abc"),(4,"ujjwal", "kaluram");
select * from emp_family;

select * from emp
where name = (select father from emp_family as e where e.eid = emp.eid);

-- In table 4 col. empid, name, salary and deptid, insert data

create table emp123(eid int primary key, fname varchar(20), salary int, department_id int);
insert into emp123 values(1,"sam", 900,10),(2,"aman", 100,10),(3,"manav", 50,10),(4,"Anmol", 200,11),
(5,"Amrit", 300,11);
insert into emp123 values(6,"deepak", 350,12);
select * from emp123;

-- i need to get avg sal and deptid

select avg(salary), department_id from emp123
group by department_id;

-- single columm subquery
select * from emp123
where salary > (select avg(salary) from emp123 as e
where emp123.department_id = e.department_id
group by department_id);

-- Multi columm subquery
select * from emp123
where (salary, department_id) in (select avg(salary), e.department_id from emp123 as e
where emp123.department_id = e.department_id
group by department_id);

create table prod(pid int primary key, product varchar(20));
insert into prod values(1,"tv"),(2,"mobile");
insert into prod values(3,"tv");

create table ord1(oid int primary key, ord_product varchar(20));
insert into ord1 values(3,"tv"),(4,"mobile");

-- Using EXISTS with Correlated Subqueries
select * from prod as p
where exists (select 'a' from ord1 as o
where o.oid = p.pid);

-- Using NOT EXISTS with Correlated Subqueries
select * from prod as p
where not exists (select 'a' from ord1 as o
where o.oid = p.pid);