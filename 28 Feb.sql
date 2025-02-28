-- Foreign Key Constraint
-- relationship define karna => entity
-- parent and child

Use regex1;

create table product(pid int primary key, amount int);
insert into product values(101,876), (102,745);
select * from product;

create table order1(oid int, city varchar(20), product_id int,
foreign key (product_id) references product(pid));

insert into order1 values(9632,'jaipur',101);
insert into order1 values(9634,'jaipur',107);  -- this will not insert bcs there is no product with 107 pid
insert into order1 values(9636,'Jammu',102);
select * from order1;


-- Cascasde

create table product12(pid int primary key, amount int);
insert into product12 values(111,876), (222,745);
insert into product12 values(333,654);
select * from product12; 


create table order12(oid int, city varchar(20), product_id int,
foreign key (product_id) references product12(pid) ON delete cascade on update cascade);

insert into order12 values(9632,'jaipur',111);
insert into order12 values(9634,'jaipur',222); 
insert into order12 values(9636,'Jammu',102);
select * from order12;

-- ON DELETE CASCADE
delete from product12 where pid = 222;

-- ON UPDATE CASCADE
update product12 set pid = 444  where pid = 333;

