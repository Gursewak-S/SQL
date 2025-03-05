use employees;

select * from salaries;

select salary, emp_no from salaries
where salary  <all(select salary from salaries where emp_no = 10003 );

select * from employees;
desc titles;
select * from titles;

select e.emp_no, e.first_name, t.title from employees as e join titles as t
where e.emp_no = t.emp_no;

-- another way 'using' keyword
select emp_no, first_name, title from employees join titles 
using (emp_no); 

select emp_no, first_name, title from employees join titles 
using (emp_no) where title = 'Manager';

select emp_no, first_name, last_name, title from employees join titles 
using (emp_no) where title <> 'Manager';

-- i need to get empno , fn, ls, title, from this emp table where position is manager and had work on another position

select emp_no, first_name, last_name, title from employees join titles 
using (emp_no) where title = 'Manager' and emp_no in (select emp_no from titles where title != 'Manager');

-- using 2 join
select distinct emp_no, first_name, last_name, mgr.title
from employees join titles mgr using (emp_no)
join titles nonmgr using (emp_no) 
where mgr.title = 'Manager'
and nonmgr.title <> 'Manager';

-- i need to get  empno , fn, ls, title, the higher date for all the empl

select emp_no, first_name, last_name, title, hire_date from employees join titles 
using (emp_no);

select emp_no, first_name, last_name, title, hire_date from employees join titles 
using (emp_no) where title = 'assistant engineer';

-- i need to get assistant engineer where the hire date is before the hiring date of the current emp working on manager position

select emp_no, first_name, last_name, title from employees join titles 
using (emp_no) where title = 'assistant engineer' and year(hire_date) < any(select year(hire_date) from employees join titles 
using (emp_no) where title = 'manager');

select emp_no, first_name, last_name, title from employees join titles 
using (emp_no) where title = 'Manager' and emp_no in (select emp_no from titles where title != 'Manager');


-- from the titles table get the empno, title, year of hire_date for the current manager position 
-- where the person has promoted to in the same year to other position

select emp_no, title, year(from_date) from titles 
where title = 'Manager' and (emp_no, year(from_date)) in (select emp_no, year(from_date) from titles where title <> 'Manager');

-- single row subquery me we can use <, >, <=
-- multi row subquery  me we use  in, any ,all but =all doesnot work
-- multo col subquery we use only in but cant use any, all
-- corelated - any dynamic condition
