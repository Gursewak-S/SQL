-- DCL => Data Control Language

-- Authentication (making sure that a user can access the MySQL Server)
-- Authorization (making sure that a user can interact with objects in the database)

use regex1;
-- user => username             (Password)
create user test identified by 'test123';

select * from mysql.user;
-- Data dict : it is an internal table which is used by mysql

Grant all privileges on sakila.* to test;

show grants for test; 

revoke all privileges on sakila.* from test;

grant select on sakila.* to test;

-- for specific column
grant select(staff_id,first_name) on sakila.staff to test;

alter user 'test' identified by 'regex';

-- to lock
alter user 'test' account lock;

-- to unlock
alter user 'test' account unlock;

-- creating role
create role sales2;
grant select on sakila.* to sales2;

create user 'sam' identified by 'sam123';
show grants for sam;

-- grant role to user
grant sales2 to sam;
set default role all to sam;

