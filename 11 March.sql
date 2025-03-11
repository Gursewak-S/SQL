-- views: virtual table
-- user => queries interact kr paye
-- Don't Store data on disk
-- reference to original table
-- using query
-- view makes complex query simpler
-- used to enchance the security => rows and column
-- views is updateable or simple view if there is one to one relationship
-- views is non-updateable or complex view if it contain aggregate function, groupby, having, union/ union all, Subquery in the select list

use regex1;
show tables;

create table payment as select * from sakila.payment;
select * from payment;

create view pay_view 
as select payment_id, customer_id from payment;

select * from pay_view;

-- If changes made in view table and original data also changes

create table payment1 
as select payment_id, customer_id from payment where payment_id <5;

create view payment2
as select * from payment1;

select * from payment2;
insert into payment2 values(7,10);
select * from payment1;

drop view details;
create view details 
as select a.*, f.film_id from sakila.actor as a join sakila.film_actor as f
where a.actor_id = f.actor_id;

select * from details;

-- Views are of two type
-- 1. Simple views / updateable
-- 2. Complex views / non-updateable

-- Learning Assign
-- View WITH CHECK OPTION Clause

-- CREATE TABLE t1 (a INT);
-- CREATE VIEW v1 AS SELECT * FROM t1 WHERE a < 2
-- WITH CHECK OPTION;
-- CREATE VIEW v2 AS SELECT * FROM v1 WHERE a > 0
-- WITH LOCAL CHECK OPTION;
-- CREATE VIEW v3 AS SELECT * FROM v1 WHERE a > 0
-- WITH CASCADED CHECK OPTION;

