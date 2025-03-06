-- TCL Statement => Transaction control language
-- transaction -> set of logical statement or collection of multiple statement
-- DDL, DML, DCL -> we use this command ans these are transaction
-- Start transaction or Stop transaction
-- Start -> DML task happened as insert, update, delete the transaction will start
-- Stop : DDL, DCL task happened then transaction stop

-- TCL : commit, rollback, savepoint

select @@autocommit;  -- by-default save the data permanently
set autocommit = 0;

use regex1; 

create table yash (id int , fname varchar(20));
insert into yash values(10,"sam");
select * from yash;

commit; -- will save data permanently

insert into yash values(11,"Aman");
rollback; -- It will discard the temporary store data

select * from yash;

insert into yash values(20,"Manav");
update yash set fname = "regex";

create table dd(id int); -- DDL command will automatically commit the temp. transaction, we dont need to use commot/ rollback

select * from yash;

insert into yash values(30,"Isha");
insert into yash values(40,"Karan");

savepoint yash_insertion;  -- will create a savepoint and we can rollback to this transaction

insert into yash values(50,"Robert");
select * from yash;

rollback to yash_insertion;
select * from yash;