-- Trigger

--triggers are nothing they are a stored program which can automatically run when an event occur 
--
--types of trigger 
--
--dml trigger 
--ddl trigger 
--system or a database event trigger 
--event based trigger 
--compound trigger 

-- Syntax:
--   Create or replace trigger name
--   {before | after} event on table
--   for each row [follow another_trigger]
--   enables / disable [When condition]
--  declare
--          statement
--  begin
--          executed
--  end;

set serveroutput on;
--
--drop table test;
--create table test( name varchar(20));
--
--create or replace trigger test_trigger
--before insert on test
--for each row
--enable
--declare
--    u_name varchar(20) := 'Sam';
--begin
--    dbms_output.put_line('Your user is' || ' ' || u_name);
--end;

-- insert into test values('abc');

--          Adding update
--create or replace trigger test_trigger
--before insert or update on test
--for each row
--enable
--declare
--    u_name varchar(20) := 'Sam';
--begin
--    if inserting then
--        dbms_output.put_line('Your user is inserting' || ' ' || u_name);
--    elsif updating then
--        dbms_output.put_line('Your user is updating' || ' ' || u_name);
--    end if;
--end;

--insert into test values('abc');

--update test set name = 'hi';

-- Ques: Create a tble user_audit and make 4 column date1 date datatype, user1 varchar
--      object1 varhr, operation1 vachr, create triger user_audit_trigger, 
--      trigger should be created befor and after ddl on schema
--      in begin insert values in user_audit, sys_date, current user name
--      obj => ora_dict_obj_name, operation => ora_sysevent 

--create table user_audit1 (date1 date, user1 varchar(20),object1 varchar(200), operation1 varchar(200));

--create or replace trigger user_audit_trigger1
--after create or drop or alter on schema
--begin
--    insert into user_audit values(sysdate, user, ora_dict_obj_name, ora_sysevent);
--end;

--select * from user_audit1;

--create table test_audit1 (name varchar(20));