create database Joins;
use Joins;
create table table1(id int);
insert into table1 values
(1),(1),(1),(2),(3),(3),(3);
select * from table1;

create table table2(id int);
insert into table2 values
(1),(1),(2),(4),(null);
select * from table2;


## cross join tablename;
select * from table1 
cross join table2;

select count(*) from table1 t1 
cross join table2;

# with condition it behave like an inner join 

select * from table1 t1 
cross join table2 t2
on t1.id=t2.id;



### inner join #### inner join is a default

select * from table1 t1 
inner join table2 t2
on t1.id=t2.id;

select count(*) from table1 t1 
inner join table2 t2
on t1.id=t2.id;



######    LEFT JOIN = INNER + REMAINING OF LEFT TABLE  #################

select * from table1 t1
left join table2 t2
on t1.id=t2.id;

select count(*) from table1 t1
left join table2 t2
on t1.id=t2.id;

###### left exculsive  join ##### 
# when we want remianing value which is not machted wiuth table 2 ####

select * from table1 t1
left join table2 t2
on t1.id=t2.id
where t2.id is null;


### Right join = inner + remaining of value right table 
select * from table1 t1
right join table2 t2
on t1.id=t2.id;


select count(*) from table1 t1
right join table2 t2
on t1.id=t2.id;

###### Right exculsive  join ##### 
# when we want remianing value which is not machted wiuth table 1 ####

select * from table1 t1
right join table2 t2
on t1.id=t2.id
where t1.id is null;

select count(*)
 from table1 t1
right join table2 t2
on t1.id=t2.id
where t1.id is null;



##======== practise question ====

create table tab(id int);
insert into tab values
(1),(1),(2),(4),(5),(null),(null);
select * from tab;

create table tab2(id int);
insert into tab2 values
(1),(2),(3),(6),(6),(null);
select * from tab2;


# cross ====

select * from tab t1 
cross join tab2 t2;

select count(*) from tab t1 
cross join tab2 t2;


### inner 

select count(*) from tab t1
inner join tab2 t2
on t1.id=t2.id;

##=====left join 
select count(*) from tab t1
left join tab2 t2
on t1.id=t2.id;

#==== right join 
select count(*) from tab t1
right join tab2 t2
on t1.id=t2.id;


# ==== FUL join 

select count(*) from tab t1
left join tab2 t2
on t1.id=t2.id
union all
select count(*) from tab t1
right join  tab2 t2
on t1.id=t2.id
where t1.id is null;


#===== Natural join 

# ( if column name is same  )
select count(*) from tab t1
natural join tab2 t2;
#if  column nam is different

alter table tab2 rename column id to eid;

# again I'm changing column name 
desc tab2;
alter table tab2 rename column eid to id;


# /////    SELF JOINS /////
#SELF JOIN IS A REGULAR JOIN IN WHICH A TABLE IS JOINED TO ITSELF 
# self join are powerful for comparing values in a column of rows with the same tables 
# select col_name from table_name T1 join table_name T2 on T1.col_name=T2.col_name

use dummy;

select * from employees;
select E1.employeenumber,E1.firstname,E1.lastname,E2.reportsto,E2.jobtitle from employees E1
inner join employees E2
on E1.employeenumber=E2.reportsto;







  
