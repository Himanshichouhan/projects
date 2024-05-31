create database Himmi;
use Himmi;
create table customer(c_id int primary key, c_name varchar(20) not null,c_address varchar(30) default "Bhopal" ,mobile varchar(12) unique);
desc customer;

insert into customer values
(101,"ABD","Bhopal",76543789760),
(102,"XYZ","Indore",76549889760),
(103,"MNO","Morena",76544389760);

create table orders(o_id int, c_id int, price decimal(10,2) not null,p_id int, foreign key (c_id) references customer(c_id));

insert into orders values
(201,101,48000,1002),
(202,102,68000,1006),
(23,101,38000,1003);

#====questions



alter table customer drop index mobile ;
desc customer;
select * from customer;

update 


#2nd question 

start transaction;

delete from customer where c_name="MNO";
set sql_safe_updates=0;
rollback;


# update 

update customer set D_O_B="1999-04-02" where c_id=101;
update customer set D_O_B="1999-10-22" where c_id=102;
update customer set D_O_B="1995-09-22" where c_id=103;




