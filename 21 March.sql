-- PL SQL
    -- programming lamguage
    -- managing the data into the database
    -- controlling the data
    
-- Advantages:
   -- Whatever the data type we have in sql we have in pl sql also
   -- in pl sql we can use func and procedures to make our logic repetitive or reusable
   -- pl sql is portable
   -- in pl sql we can store it centrally into my database and multiple user can use it
   -- we have error checking compatibility using error checking handling in pl sql like error handling 
        
 -- Generally we write out pl sql code in 3 blocks
    -- Declare => variables , cursors , sub-programs are declared in declare block. (It is a optional      block)
    -- Executable block/commands => this is a mandatory session we have begin block then we have end block too
                 -- an executable query is written in this block
                 -- we should have at least one line in this even it is null
            -- Begin
            -- end 
     -- exception handling => optional [error handle]
     
SET SERVEROUTPUT ON;
declare
    msg varchar(30) := 'hello world by sam';
begin
    dbms_output.put_line('hello');
    dbms_output.put_line(msg);
    dbms_output.put_line(msg || ' ' || '###'); -- concat 2 value
end;

-- Learning assign
--What is cursor
-- implicit and explicit cursor


