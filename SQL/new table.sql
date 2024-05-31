create database new_table;
use new_table;
create table Cust_table(c_id int primary key, c_name varchar(20), mobile varchar(12) unique, city varchar(20) default("Bhopal"));
desc Cust_table;

# order table 
create table o_table(o_id int primary key, o_date date, o_qty tinyint, c_id int, 
foreign key (c_id) references Cust_table(c_id)  on delete set null on update cascade);

# payment table ====
create table p_table(p_id int primary key, p_mode varchar(20), price decimal(10,2), c_id int , o_id int, 
foreign key (c_id) references Cust_table(c_id)  on delete set null on update cascade,
foreign key (o_id) references o_table(o_id)  on delete set null on update cascade);


# insert data in table =====


show databases;
use diagram;


