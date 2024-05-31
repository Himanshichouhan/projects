#Mathes Functions
select abs(-100);
#return always absolute value means always positive 
select abs(-10);
use dummy;
#write a sql query that retirn the productcode, productline and buyprice- MRP
select * from products;
select Productcode, Productline,(MSRP-buyprice) from products;

#Floor Division floor()
#write a sql query tpo find the average of stock for each priductline
select  avg(quantityinstock) from products;
select  floor(avg(quantityinstock)) from products;

# seal division ceil()
#write asql query to find the average manufactire suggested retail price of all pr0duct by productline
select   Productline, ceil(avg(MSRP)) from products
group by  productline;

# ------ Mode  mod(divident, division) mod(10,3) -------
select mod(10,3);
select mod(3,10);


# write a sql query to to determine waether the quantity of product that the customer order is  odd or even.
#orderno. sum(qty order, if condition 
select * from orderdetails;
select ordernumber, sum(quantityordered) as sales_order,
if(mod(sum(quantityordered),2)=0,"Even","Odd") Odd_Even
from orderdetails
order by ordernumber;


#---- Trauncate 
#syntax _ truncate (X, D)
# X isw a anumber or a numeric expression  that you want to trucate
# D is a number of decimal places that you want t truncate to 
select truncate(12.5,1);


# ----- ROUND (n, {d})------
# n id za number to be rounded
# d is the number of deciml places to which the number is rounded.alter#the number of decimal places ( D ) is optional,
# It default to 0 if you skip it
 
select truncate(1.499,1), round(1.599,1);
select truncate(1.999,1), round(1.999,1);

select round(12.5);
select truncate(1.1,0);

