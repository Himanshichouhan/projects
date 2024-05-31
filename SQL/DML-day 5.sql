use dummy;
show tables;
desc customers;

desc employees;

desc offices;
select * from employees;

desc orders	;



#33=-===== select column from the tablename


#===single columne 
select lastname from employees;




#====multi column list 

select customernumber, customername,phone,city,state from customers;

#all column===
select * from customers;

#==== select

select 1+1;

select now();



#concate 



# order by clause ==== sorting asc?desc===alter
#order by column list from tables 
#order by column (asc/dec)
 #column2 {asc/Des}
 
 
 select contactlastname, contactfirstname from customers
 order by contactlastname asc;
 
  
   select contactlastname, contactfirstname from customers
   order by contactlastname desc,contactfirstname asc;
   
   #
select * from orderdetails;
select  ordernumber,orderlinenumber, (priceEach * quantityordered) as total from orderdetails;

#arrange in ascending way

select  ordernumber,orderlinenumber, (priceEach * quantityordered) as total from orderdetails
order by total desc;

 
##order by null

select * from employees;

select firstname,lastname,reportsto from employees;

 
select firstname,lastname,reportsto from employees
order by reportsto desc;
