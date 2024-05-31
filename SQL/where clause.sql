use dummy;

############     WHERE CLAUSE    ####################
# where clause with equality opertaor===\


# write a SQL querry to fincd the all employees 
#whoes job tittle are "slaes rep".

select * from employees;

select firstname,lastname,jobtitle from employees
where jobtitle="sales rep";


#write a sql quert to find all the edmployees
#whose job title are "sales rep" and office code is 1


# and ====
select firstname,lastname,jobtitle,officecode from employees 
where jobtitle="sales rep" and officecode=1;

##### OR  #####
select firstname,lastname,jobtitle,officecode from employees 
where jobtitle="sales rep" or officecode=1;


# COMPARISON OPERATOR 3#######

select firstname,jobtitle,officecode from employees 
where officecode<> 1 order by officecode asc;

select firstname,jobtitle,officecode from employees 
where officecode <>1 order by officecode asc;


## questions tpo practise ########
  #write a sql query to fetch the records  of a customer having orderline number greater then 2 ?
  select * from orderdetails;
  #orderno, productcode, quantity order, orderline no >2
  
  select ordernumber,productcode,quantityOrdered,orderlinenumber from orderdetails
  where orderlinenumber >2 order by ordernumber desc;
  
  
  
  # sorting with 2 condition order by
  
    select ordernumber,productcode,quantityOrdered,orderlinenumber from orderdetails
  where orderlinenumber >2 order by ordernumber desc,
  orderlinenumber asc;
  
  
     select ordernumber,productcode,quantityOrdered,orderlinenumber from orderdetails
  where orderlinenumber >2 or quantityordered <60 order by ordernumber desc,
  orderlinenumber desc;
  
  
  
  #### BETWEEN ORPERATOR #####
  #between always include lowest and highest vales ####
  #example 2 to 5 so between inclue 2 and 5 values also###
  
  
  
  
  
  #WRITE A SQL QUERY TO FIND EMPLOYEES who are located in offices 
  #whose office code is from 2 to 5. 
  #1stname, lastname , office code ####
  select * from employees;
  
  select firstname,lastname,officecode from employees
  where officecode between 2 and 5
  order by officecode;
  
  
  
  #### write a SQL query to find the ordernumber, customernumber and orderdate
  
  #orderdate=2003
  
  select * from orders;
  select ordernumber,customernumber,orderdate from orders
  where orderdate between "2003-01-31" and "2003-12-31";
  
  
  # employee first name last name office code should be 1 , 3 , 5 
  
  #######    IN OPERATPR    ###########
  
  
  
  select firstname, lastname, officecode from employees where officecode in (1,3,5);
  
  
  
  

  #write sql qurry  country should be USA and frach
  
  select * from customers;
  
  select  customernumber,contactfirstname,city,phone, country
  from customers 
  where country in ("USA","france");
  
  
  ### write a sql querry to find the offices located not in the USA And France 
  # I want officecode, city , phone,country
  
  ## *******Not IN ******
  use dummy;
   select * from offices;
select officecode,city,phone,country from offices where country not in ("USA","france");
  
  #*** and *****
  
select officecode,city,phone,country from offices where country <> "USA" and country <> "France";


# *************

#   Distinct   

#******


select * from employees;

select lastname from employees order by lastname desc;

select distinct lastname from employees
order by lastname desc;

select distinct status from orders;


select * from customers;
select contactlastname from customers;

select contactlastname from customers 
order by contactlastname desc;
 
select distinct contactlastname from customers;


######## destinct clause _ NUL values
select * from customers;

select state from customers;
select city,state from customers;


select  state,city from customers
where state is not null
order by state,city;


select distinct state,city from customers
where state is not null
order by state,city;

##### practise question #######

select * from employees;

select * from employees 
where reportsTo is null;

select * from employees 
where reportsTo is not null;


####### never use + while we are using null===#######


# limit we use to apply limit
## limit give top values 


select * from employees limit 5;


## questions 1 
#customer name, customer number, creditlimt



select * from customers;

# top 5 highest credit limit

select customerNumber,customername,creditlimit from customers  order by creditlimit desc limit 5; 

select customerNumber,customername,creditlimit from customers  order by creditlimit desc limit 5 offset 0;

# to find top 2 credit limit offrset should be 1 and records is only 1
# offset 1 quki top second position k liye cchahiye 
# limit 1 quki sirk ek chahiye 

select customerNumber,customername,creditlimit from customers  order by creditlimit desc limit 1,1;  

# find productline unique value and order by desc###

select * from products;
 select  distinct productline from products ;
 
  select  distinct productline from products  order by productline desc;
  
  
  
  ##### LIKe#####
  
  #  select  <Coulumn name> from  <Tablename> where <column name> like "a%"  #######
  
  #find the employees whoes firstnbame start with a 
  
  select * from employees;
  select employeenumber, firstname, lastname from employees where firstname like "a%";
  
  ## question 1 lastname end with ON ###
    select employeenumber, firstname, lastname from employees where Firstname like "T%" and lastname like "%G";
    
    
    ### underscore _  ( like "T_M")####
    # Tam to find we use like "T_M"
    
    select employeenumber, firstname, lastname from employees where firstname like "T_M";
    
  