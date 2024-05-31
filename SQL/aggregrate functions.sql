#------- FUNCTION ---------

# QUESTION 1 :- write a sql query to calculate the average by price for eahproductline
select * from products;
select productline,avg(buyprice) from products group by productline order by productline;

#write a sql query to get the no. of product for each produtline

select productline,Count(buyprice) from products group by productline order by productline;

# write a sql query to get 
select productline,avg(buyprice),count(*) from products group by productline order by productline;

# write a sql query to get the total order value of each product
select * from products;
select productcode, sum(quantityordered*priceeach)as total from orderdetails group by productcode order by productcode;


select productname,productcode, sum(quantityordered*priceeach)as total from orderdetails
inner join products using (productcode) group by productcode order by productcode;


#write a sql query to get the maximum buyproice of each productline
select productline,max(buyprice),min(buyprice) from products group by productline order by productline;
select productline,Count(buyprice) from products group by productline having;

use dummy;
# ------ Firstname, lastname,
select * from employees;
select distinct firstname,lastname,jobtitle from employees;

#------ COUNT DISTINCT -----
# distinct here we use like key word not az function way 
 select firstname,lastname,jobtitle from employees;
 select distinct jobtitle from employees;
 select count(distinct jobtitle) from employees;
 
 
 
 #                      ----- Group_Concate ----- functions 
 #select firstnanme,lastname and customername
 
 select firstname,lastname,customername from employees e
 inner join customers c on e.employeenumber=c.salesrepemployeenumber;
 # we have many customer name for sible employeename
 
 
 # ******* I M P  O R T A N T   T O P I C **********
 
 select firstname,lastname,group_concat(distinct customername order by customername) as customersname from employees e
 inner join customers c on e.employeenumber=c.salesrepemployeenumber
 group by employeenumber order by firstname,lastname;
 
 use dummy;
 # practise for group_concate 
 select * from employees;

 select employeenumber,Jobtitle,group_concat( distinct firstname," ",lastname order by Firstname) from employees 
 group by jobtitle,employeenumber order by jobtitle ;

 select m.Jobtitle, concat(m.firstname," ",m.lastname) as fullname,group_concat(distinct e.firstname,e.lastname order by e.firstname,e.lastname ) reportsTo from employees e 
 inner join employees m on e.reportsTo=m.employeenumber
 group by fullname,jobtitle order by fullname;
 
 
 
 # 2nd scenario
  select * from products;
 select * from orderdetails;
  select * from productlines;
 select group_concat(Distinct p.productline order by productline) from products p
 ;
 
 
 #3rd scenario
 
 select Jobtitle,group_concat(distinct firstname order by firstname ) as reportto from employees e 
 group by jobtitle;
 select Jobtitle,group_concat(distinct concat(firstname," ",lastname) order by firstname) as reportsTo from employees 
 group by jobtitle;
 
 
 # 4th scenario
 
 select employeenumber, firstname,lastname,customername from employees e 
 inner join customers c on e.employeenumber=c.salesrepemployeenumber
 order by firstname,lastname;
 
  select employeenumber, firstname,lastname,
  group_concat(distinct customername order by customername)
  from employees e 
 inner join customers c on e.employeenumber=c.salesrepemployeenumber
 group by employeenumber, firstname,lastname
 order by firstname,lastname;