create database HimanshiChouhan;
use HimanshiChouhan;
create table Detail(F_name varchar(25),L_name varchar(25),Mobile_no varchar(12),D_O_B date,Course varchar(25),fees decimal(10,2));
select * from Detail;
desc Detail;

####insert #####
insert into Detail(F_name,L_name,Mobile_no,D_O_B,Course,fees) values
("Himanshi","Chouhan",917389725476,"1999-10-04","Data_analyst",42000);

##========add multiple rowa ============
insert into Detail(F_name,L_name,Mobile_no,D_O_B,Course,fees) values
("Varsha","Chouhan",917389725476,"1999-10-04","Data_analyst",42000),
("Jyoti","Chouhan",917389725476,"1999-10-04","Data_analyst",42000),
("Ridisha","Chouhan",917389725476,"1999-10-04","Data_analyst",42000),
("Shree","Chouhan",917389725476,"1999-10-04","Data_analyst",42000);

select * from Detail; 



#===============insert extension method sets ======================
insert into Detail set
F_name="Aaru",L_name="singh",Mobile_no=916754897632,D_O_B="2017-06-12",Course="data_sceince",fees=24000;


delete from Detail where F_name="Jyoti";

set sql_safe_updates=0;

start transaction;
delete from Detail where F_name="Shree";

rollback;

show datab

