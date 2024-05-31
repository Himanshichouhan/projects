create database Himanshi;
use Himanshi;
create table student(S_id int,S_name varchar(20),mobile char(12),fees decimal(10,2),D_O_B date);
desc student;
rename table student to details;
desc details;
#### alter 
 
alter table details add column P_name varchar(20);
 ##### drop (delete krne k liye)
 
 alter table details drop column fees;
select * from details;