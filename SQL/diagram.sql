create database diagram;
use diagram;
create table users(u_id int primary key, u_name varchar(20) not null, email varchar(20) not null, mobile varchar(12) unique);
desc users;

#======address====
create table address(add_id int primary key, user_id int,state varchar(20) default "Madhya Pradesh",city varchar(15) default "Bhopal",Pincode int, 
foreign key (user_id)  references users(u_id) on delete set null on update cascade);

#====restauarant table ======
create table restaurant(rest_id int primary key, r_name varchar(20) not null, r_address varchar(30),r_phone varchar(15) );


#======== alter to add foreing key ion order====  
desc orders;

alter table orders add column driver_id int; 
alter table orders drop column drice_id; 

desc driver;


alter table orders add foreign key(driver_id) references driver(d_id); 

