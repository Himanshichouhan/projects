#--------- subqueries -----------
# it will work in all DML query select update delete insert
# inner query run first then outer query run


# question of subqueries
#write a subqueries to return the employee who works in the offices located in USA
use dummy;
select * from offices;
select firstName, Lastname from employees
inner join offices using(officecode)
where country in ("USA");

# by subqueries
select firstName, Lastname from employees 
where officecode in (
select officecode from offices where country="USA");

# write a sql query return the custommer who has the highest payment?

select customerNumber, paymentdate,checknumber from payments
 where amount = ( select max(amount) from payments);
 
 select customerNumber,amount from payments
 group by customerNumber,amount
 order by amount desc limit 1;
 
# find customers whois payment is greater then average payment use subquery
# customer no, vcheck no, amount,
select customerNumber, paymentdate,checknumber,amount from payments
where amount > ( select avg(amount) from payments);

# ques
#find the maximum, minimum, and average number of items in sale order

select max(item),min(item),avg(item) from 
(select ordernumber, count(ordernumber) as item 
from orderdetails group by ordernumber) as subquery;


with cte as
(select ordernumber, count(ordernumber) as item 
from orderdetails group by ordernumber) 
select max(item),min(item),avg(item) from cte; 

use dummy;
# ------ write a sql query to get thetop five product  by sales revenue in 2003 productcode and sales 
select * from orders;
select * from orderdetails;

# joins 
select Productcode,sum(priceEach*quantityordered) as Revenue from orderdetails
inner join orders using (orderNumber)
where year(orderdate)="2003"
group by productcode
order by revenue desc limit 5;

# joins witrh product name
select productname,Productcode,sum(priceEach*quantityordered) as Revenue from orderdetails
inner join orders using (orderNumber)
inner join products using (productcode)
where year(orderdate)="2003"
group by productcode
order by revenue desc limit 5;


#subqueries 
select productname,productcode,sales from
( select productcode,round(sum(quantityordered*priceeach)) as sales
from orders 
inner join orderdetails using (ordernumber)
where year(orderdate)=2003
group by productcode
order by sales desc limit 5) as top5
inner join products using (productcode);

# with  CTE 
with top5 as
(select productcode, round(sum(priceEach*quantityordered)) as sales,year(orderdate),
dense_rank() over(partition by year(orderdate) 
order by round(sum(priceEach*quantityordered)) desc) as sales_rank
from orders 
inner join orderdetails using (ordernumber)
where year(orderdate)=2003
group by productcode, year(orderdate))
select productcode, productname,sales 
from top5
inner join products using (productcode)
where sales_rank<=5;




# write a sql query that classify the customers who bought products in 2003 into three groups platinum, gold, silver
-- platinum customer who have total ordervalue >100K
-- gold customer who have ordervalue between 10 k and 100K
-- silver customer who  have ordervalue <10K


with cte as 
(select  productName, round(sum(quantityInStock*buyPrice)) as total, year(orderdate) from products
inner join orderdetails using (productcode)
inner join orders using (ordernumber)
where year(orderdate) = 2003
group by productname,year(orderdate))
select productname,
 CASE
        WHEN total >= 1000000 THEN 'Platinum'
        WHEN total >= 100000 THEN 'Gold'
        WHEN total < 10000 THEN 'Silver'
    END AS cust_groups
from cte;


# by if conditions 
with cte as 
(select  productName, round(sum(quantityInStock*buyPrice)) as total, year(orderdate) from products
inner join orderdetails using (productcode)
inner join orders using (ordernumber)
where year(orderdate) = 2003
group by productname,year(orderdate))
select productname,
 if (sum(total) >=1000000,"Platinum",
 if (sum(total)>=100000,"Gold",
 if(sum(total) <100000,"Silver","Others"))) as total_order
 from cte
 group by productname, total;
 
 #---- write a sql subqueri to retrive the top 5 sales, representative based on their total sales in the year 2003 employee
 #employeeno. firstname, lastname, total sales, 
use dummy;
select * from orders; #Or, No, orderdate
select * from orderdetails; #quantityordered*PriceEach
select * from customers; #customernumber for join
select * from employees; #employeenumber, firstname, lastname

select employeenumber,firstname,lastname,sum(quantityordered*PriceEach)as total_sales from employees e 
inner join customers c  on e.Employeenumber=c.salesRepEmployeeNumber
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
group by employeenumber,firstname, lastname
order by total_sales desc limit 5;






select employeenumber,firstname,lastname,sum(quantityordered*PriceEach)as total_sales from employees e 
inner join customers c  on e.Employeenumber=c.salesRepEmployeeNumber
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
group by employeenumber,firstname, lastname
order by total_sales desc limit 5;



# write a sql query to map the customer with their sales representative 
# write a sql query to get the sales representative located in the USA including their offie information
# firstname, lastname, postalcode. officeinformation.
 