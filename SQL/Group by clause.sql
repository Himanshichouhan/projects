#### group by clause #####
use  dummy;
select * from orders;
select distinct status from orders;


# group by to find unique values 
# to find count of unique status we can use group by also insteaqd of distinct
select status from orders group by status;

#//// to find count of the unique status
select status, count(*) from orders group by status;

#Question 1 write a sql query to get the total amount of all order by status
select * from orderdetails;
select * from orders;

select status, sum(priceeach*quantityordered) as total from orders O
inner join orderdetails Od on O.ordernumber=Od.ordernumber
group by status;

 #//// or////
 
select status, sum(priceeach*quantityordered) as total from orders O
inner join orderdetails Od using (ordernumber)
group by status;

# que 2 :- write a sql query to get the total amount of all order by ordernumber
select o.ordernumber, sum(priceeach*quantityordered) as total from orders O
inner join orderdetails Od using (ordernumber)
group by ordernumber;

