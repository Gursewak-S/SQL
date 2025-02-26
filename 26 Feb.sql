-- Data type of SQL
-- numeric, String data, date time

-- int (numerical)
-- integer => 4bytes => 4*8 =>32
-- INT [(width)] [UNSIGNED] [ZEROFILL]
-- -2,147,483,648 to 2,147,483,647  ( 4 byte storage)

create database regex;
use regex;

-- ddl statement
create table employee(eid int);
insert into employee values(2147483647);
select * from employee; 

-- Zerofill
create table emp1(eid int(4) zerofill);
insert into emp1 values(759);
select * from emp1; 

-- unsigned (Positive value)
create table emp2(eid int unsigned);
insert into emp2 values(759498156);
select * from emp2; 

-- int => 4 byte
-- big int => 8
-- tinyint => 1 byte => -128 to 127
-- mediumint => 3 
-- smallint => 2

create table emp3(eid tinyint);
insert into emp3 values(127);
select * from emp3; 

-- Boolean True/False value store in Tinyint
insert into emp3 values(True);
select * from emp3; 


-- float and double
create table emp4(id float);
insert into emp4 values(122.518219868);
select * from emp4; 

create table emp5(id float(4,2));   -- (Total digit, Decimal value)
insert into emp5 values(52.51828);
insert into emp5 values(52);
select * from emp5; 

-- varchar => variable length character
-- char => fixed length character

-- Generaly we use varchar not char(bcs in this there is wastage of memory )

create table emp6(name1 char(4)); 
insert into emp6 values("an");
insert into emp6 values("zz     ");  -- char truncate all the spaces
select name1, length(name1) from emp6; 

-- varchar include spaces
create table emp7(name1 varchar(5)); 
insert into emp7 values("Manav");
insert into emp7 values("S    ");
insert into emp7 values("aa  ");
select name1, length(name1) from emp7;
/*
CHAR	                                                                         VARCHAR
1.  As the name suggests, CHAR stands for characters.	                - As the name suggests, VARCHAR stands for variable characters.
2. CHAR in MySQL stores characters of fixed length.	                   - VARCHAR in MySQL stores characters of variable size.
3. CHAR in MySQL is used when the length of data is known              - VARCHAR in MySQL is used when the length of data is unknown.
     so that we declare the field with the same length.	                
4. CHAR in MySQL considers a space of 1 byte for storing              	- VARCHAR in MySQL considers a space of 1 byte for each character and it also considers some more bytes to store information about length.
     each character.
5. CHAR in MySQL has the concept of static memory allocation.	        - VARCHAR in MySQL has the concept of dynamic memory allocation.
6. CHAR in MySQL can store data up to 255 characters.	                - VARCHAR in MySQL can store data up to 65,535 characters.
7.  CHAR pads values with spaces to reach the defined length,           - VARCHAR does not pad values; it stores only the actual data without adding extra spaces.
    even if the data is shorter.	
8. CHAR may offer slightly better performance for exact-length         - VARCHAR may have a slight performance overhead for exact-length searches due to variable-length storage.
      searches and comparisons due to fixed-length storage.	
*/

-- date
create table test(dob date);
-- YYYY-MM-DD    hh:mm:ss
insert into test values("2022-05-12");
select * from test; 


-- Learning Assign
-- blob datatype
-- How we store image in mysql


