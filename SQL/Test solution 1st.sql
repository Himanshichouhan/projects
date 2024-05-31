create  database Employees;
use Employees;
create table EMP(e_id int primary key Auto_increment,Emp_name varchar(50) not null,Salary decimal(10,1),D_O_J date not null,city varchar(20) default "Mumbai",Mobile varchar(15) unique);

insert into EMP
(e_id,Emp_name,salary,D_O_J,city,Mobile) values
(101,"Himmi",78000,"2024-03-01","Bhopal",8765543267),
(102,"Reshu",88000,"2024-04-01","Indore",8985543267);

select * from EMP;

create table Manager(m_id int, M_name varchar(20) not null, Dept_name varchar(30),
foreign key (m_id) references EMP(e_id));


## Question 4
Update EMP set Emp_name="EmployeeTable" where e_id=101;


# question 5

start transaction;

set sql_safe_updates=0;
delete from EMP where city="Indore";

# questipn6 


start transaction;
delete from EMP;
rollback;


# question 7 
select * from EMP;

# question 8

alter table Manager add unique(M_name);


# question 9
alter table Manager add primary key(M_name);
alter table EMP drop index mobile;
alter table Manager drop primary key;


