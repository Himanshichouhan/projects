create database Zomato;
use Zomato;
create table Customer(c_id int primary key, c_name varchar(20), mobile varchar(12) unique, city varchar(20) default("Bhopal"));
desc Customer;


# Payment table ====
create table payment (p_id int primary key, p_mode varchar(20), price decimal (10.2));
desc payment;

# order Table====
create table z_order(O_id int primary key ,c_id int,p_id int, foreign key (c_id) references  Customer(c_id) on delete set null  on update cascade,

foreign key (p_id) references  payment(p_id)  on delete set null on update cascade); 
desc z_order;
use new_table;

