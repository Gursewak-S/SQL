-- constraint
-- set of rules and regulation
-- if certain command dont follow rules then its invalid data and it will didnt store

create database regex1;
use regex1;

create table emp(id int);
insert into emp values(10),(20),(null),(30);
select count(*) from emp;

-- count(*) => It will count all rows and null value
-- count(id) = > it will not count null value

select count(id) from emp;

select id, id*5 from emp;

-- using constraints

create table emp1(id int not null);
insert into emp1 values(10),(20);
insert into emp1 values(null);
select id, id*5 from emp1;


create table emp2(id int, salary int default 0);
insert into emp2 values(10, 90),(20,100);
insert into emp2(id,salary) values(30,null);
insert into emp2(id) values(40);
select * from emp2;


create table emp3(id int, salary int unique);
insert into emp3 values(10, 90),(20,100);
insert into emp3(id,salary) values(30,100);   -- we cant insert duplicate value in unique but can store null value
insert into emp3(id,salary) values(40,null);
select * from emp3;

-- primary key  -> it store unique and not null value
create table emp4(id int primary key, salary int unique);
insert into emp4 values(10, 90),(20,100);
insert into emp4(id,salary) values(null,102); 
insert into emp4(id,salary) values(10,null);
select * from emp4;

-- constraint is a better way to find error that where it occur
create table emp5(id int primary key, fname varchar(20), 
salary int, constraint regex_emp_salary_uk unique(salary));  -- It will give custom error

insert into emp5 values(10, 'a', 99),(20, 'b', 99);


-- Ques Create a tABLE NAME student in which std id, name, fee, clg name and phone no, std id and name is primary key
--        fee cannot be not null. The clg default value will be regex and the most impt part the phone no will be unique
  --     constaint and you have to give the constaint name for each and every values
  

create table student(id int, name1 varchar(20), fee int not null, College_name varchar(20) default "regex", 
          Phone_no int , constraint student_id_name_pk primary key(id,name1), constraint student_phone_no unique(Phone_no));
		
insert into student values(1,"sam",2000,"LPU",600501), (2,"aman",4000,'CU',800501);
insert into student(id,name1,fee,Phone_no) values(3,"raj",2000,184501);
insert into student values(4,"Manav",2000,"LPU",600501);
select * from student;

-- Leaning assign
-- normalization and its type
-- what are acid properties and its uses
-- co-related Subquery