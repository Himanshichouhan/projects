#    COLESCE FUNCTION
# fUNCTION USED TO HANDLE N ULL VALUSE 
select * from customers;
select customername, city, state,country from customers;

# in city we have a multiple null value 
select customername, city, coalesce(state,"N/A"),country from customers;

# ****** coalesce function and ifnull value behave like same in two arguments 

# coalesce workn in multiple argements and ifnull work only in one arguments;



#

create table coalesce(c_id int,Fname varchar(20),Mname varchar(20),Lname varchar(20));
select coalesce(null,null,null,0);
select ifnull(null,0);

select customername, city, ifnull(state,"N/A"),country from customers;

#****************** create table *****************
create table coalesce(c_id int,Fname varchar(20),Mname varchar(20),Lname varchar(20));

insert into coalesce values(1,"A",null,"H"),
(2,"B",null,"Q"),(3,"C","Y",null),(4,"D","Z","J"),(5,"E",null,"R"),(6,"F","P","K");
select * from coalesce;
 
#practise to 

select c_id,concat(fname," ",mname," ",lname) as fullname from coalesce;
# to remove null value in full name we sue space string
select c_id,concat(fname," ",coalesce(mname," "),lname) as fullname from coalesce;

select c_id,concat(fname," ",coalesce(mname," "),coalesce(lname," ")) as fullname from coalesce;

