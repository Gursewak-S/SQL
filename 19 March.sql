-- index
-- sequential searching (slow) so we use
-- index => reference of your data
-- help in query optimize (fast)

-- primary key, unique key (column)
-- identifier
-- select * from where col = value
-- index => BST tree
-- clustured index

use regex1;

-- without using clustured index
create table users(id int, fname varchar(20));
insert into users values(10,'tushar'),(11,'aman'),(12,'prakul'),(13,'anmol'),(14,'om'),(15,'naina');

explain select * from users where id=11;

-- with clustured index
drop table users;
create table users(id int primary key, fname varchar(20));
insert into users values(10,'tushar'),(11,'aman'),(12,'prakul'),(13,'anmol'),(14,'om'),(15,'naina');

explain select * from users where id=11;
show indexes from users;

-- cardinality mean uniqueness(unique values)

-- creating index for column which is not clustured index and by providing index, finding data will be faster
create index user_f on users(fname);
explain select * from users where fname = 'om';

-- we can delete index by using alter and drop
show indexes from users;
drop index `PRIMARY` on users;
show indexes from users;

-- Diff btn Clustured index vs non-clustured index ****
-- primary, unique is clustured index
-- by creating own is non-clustured index eg create index user_f on users(fname);

-- create table with 3 column id, fname, lastname.. enter 4 records
-- use select query on fname and lname and check table and do explain query and make non-clustured index
-- on both fname and lname

-- composite index => by giving two column name into non-clustured index is called composite
-- eg: create index user_f on users(fname, lname);

create table mydata(id int, fname varchar(20), lname varchar(20));
insert into mydata values(10,'tushar', 'Shah'),(11,'aman', 'mishra'),
(12,'prakul', 'sharma'),(13,'anmol', 'Hemani');

explain select * from mydata where fname = 'aman';

create index my_data on mydata(fname, lname);

explain select * from mydata where lname = 'Hemani';
-- it depends on sequence because we have the lname on 2 index that's why it will search all the rows.

-- prefix index and invisible index
