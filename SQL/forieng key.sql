create database Himanshi ;
use Himanshi;
create table user1(u_id int primary key,u_name varchar(20) not null,mobile varchar(12) unique);
desc user1;
insert into user1 values 
(2,"ABC","9654327821"),
(3,"efg","754327821"),
(4,"hyu","7654767821"),
(5,"vre","769027821");
select *from user1;


#=====product table =======
create table product1(p_id int primary key,p_name varchar(20) not null,price decimal(10,2));

insert into product1 values
(201,"Hp","48000"),
(202,"Dell","38000"),
(203,"Lenova","68000"),
(204,"apple","88000");

select * from product1;

use Himanshi;

#=======order table =======

create table order1(o_id int primary key, user_id int  , p_id int, foreign key (user_id) references  user1(u_id) on delete set null  on update cascade,

foreign key (p_id) references  product1(p_id)  on delete set null on update cascade);
