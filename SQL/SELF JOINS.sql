use dummy;

## self joins ######
# /////    SELF JOINS /////
#SELF JOIN IS A REGULAR JOIN IN WHICH A TABLE IS JOINED TO ITSELF 
# self join are powerful for comparing values in a column of rows with the same tables 
# select col_name from table_name T1 join table_name T2 on T1.col_name=T2.col_name



select * from employees;
select m.employeenumber, concat(m.lastname," ",m.firstname) as manager,
concat(e.lastname," ",e.firstname) as 'direct report',e.employeenumber
from employees e
inner join employees m
on m.employeenumber=e.reportsto
order by manager;

select m.employeenumber, concat(m.lastname," ",m.firstname) as manager,
concat(e.lastname," ",e.firstname) as 'direct report',e.employeenumber
from employees e
inner join employees m
on e.employeenumber = m.reportsto 
order by manager;


# left joim 
select m.employeenumber, concat(m.lastname," ",m.firstname) as manager,
concat(e.lastname," ",e.firstname) as 'direct report',e.employeenumber
from employees e
left join employees m
on  e.reportsto = m.employeenumber
order by manager;



# question for H.W
use dummy;
create table family(member_id varchar(10),name varchar(10),Age tinyint,parent_id varchar(10));
desc family;
insert into family(member_id,name,Age,parent_id) 
values ("F1","A","2","F4"),("F2","B","6","F4"),("F3","C",4,"F4"),("F4","D",36,"F6"),("F5","E",46,NULL),("F6","F",70,NULL),("F7","G",8,"F5"),("F8","H",10,"F5");
select * from family;

select c.member_id,c.age,
c.parent_id as parent_name,
p.age as parent_age
from family C 
inner join family p 
on c.parent_id=p.member_id
order by member_id;

select c.member_id as Cname,c.age as Cage,c.parent_id as Pname,p.age as Page from family c 
inner join family p 
on c.parent_id=p.member_id
order by c.member_id;

Select c.name,c.age,p.name,p.age
from family c 
inner join family p 
on p.member_id=c.parent_id
order by c.name;

Select c.name,c.age,p.name,p.age
from family c 
inner join family p 
on c.member_id=p.parent_id
order by c.name;







