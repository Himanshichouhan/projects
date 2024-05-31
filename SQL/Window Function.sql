#3--------WINDOW FUNCTION -----

create database windowFn;
use windowFn;
create table sales (
sales_employee varchar(50) not null,
fiscal_year int not null,
sale decimal(14,2) not null
);

insert into sales(sales_employee,fiscal_year,sale)
values ('Bob',2016,100),('Bob',2017,150),('Bob',2018,200),
('Alice',2016,100),('Alice',2017,100),('Alice',2018,200),
('John',2016,200),('John',2017,150),('John',2018,250);
select * from sales;

# write a sql query that return the total sales value of all employee
select sum(sale) from sales;


select fiscal_year,sales_employee,sale,sum(sale) from sales
group by sales_employee,fiscal_year,sales;

select sales_employee,fiscal_year,sale,
sum(sale) over() from sales;

select sales_employee,fiscal_year,sale,
sum(sale) over(partition by fiscal_year) from sales;

select sales_employee,fiscal_year,sale,
sum(sale) over(partition by sales_employee order by fiscal_year asc) from sales;



# ----- ROW NUMbers
select sales_employee,fiscal_year,sale,
sum(sale)over(partition by sales_employee)as Total_sum,
count(sale)over(partition by fiscal_year)as Total_count,
max(sale)over(partition by fiscal_year)as Total_max,
avg(sale)over(partition by fiscal_year)as Total_avg from sales
;

# questions
#write a sql query  that return the productname , MSRP, and also assign a sequence no to each record from the product table.
use dummy;


select row_number()
 over(partition by productline)as row_no,
 productline,quantityInStock,MSRP 
 from products;
 
 
 
 # to find top 3 in the outcome table with products
 with cte as
 (select row_number()
 over(partition by productline)as row_no,
 productline,quantityInStock,MSRP 
 from products)
 select * from cte
 where row_no <=3;
 
 
 #new question with windowFn
 select * from sales;
select s1.*,
row_number() over(),
rank() over(),
dense_rank() over()
from sales s1;


 select * from sales;
select s1.*,
row_number() over(partition by fiscal_year) row_1,
rank() over(partition by fiscal_year)Rank_1,
dense_rank() over(partition by fiscal_year) dense
from sales s1;


select s1.*,
row_number() over(partition by sales_employee) row_1,
rank() over(partition by sales_employee)Rank_1,
dense_rank() over(partition by sales_employee) dense
from sales s1;

select *,
row_number() over(partition by fiscal_year order by sale desc) row_1,
rank() over(partition by fiscal_year order by sale desc)Rank_1,
dense_rank() over(partition by fiscal_year order by sale desc) dense
from sales ;


use dummy ;
# write a sql query to find the top three highest value orderes in each year 
#ordern0, orderyear,ordervalue
select * from orderdetails;
select * from orders;

select orderNumber, priceeach*quantityOrdered,  year(orderDate) ,
row_number() over(partition by year(orderDate) order by priceeach*quantityOrdered desc) row_1
from orderdetails
inner join orders using (ordernumber);

with cte as 
(select orderNumber, priceeach*quantityOrdered,  year(orderDate) ,
rank() over(partition by year(orderDate) order by priceeach*quantityOrdered desc) rank1
from orderdetails
inner join orders using (ordernumber))
select * from cte 
where rank1 <=3;


#---------------- Question 
#write a sql query to that returns the 3rd highest creadit limt of customer
#select customername, customerno, city and country

select * from customers;

select customername,customerNumber,city,Country,creditlimit,
rank() over(order by creditLimit desc) as rank1 from customers;

with cte as(
select customername,customerNumber,city,Country,creditlimit,
dense_rank() over(order by creditLimit desc ) as rank1 from customers)
select * from cte
where rank1=3;


# question 

select *,
row_number() over(partition by fiscal_year order by sale desc) row_1,
rank() over(partition by fiscal_year order by sale desc)Rank_1,
dense_rank() over(partition by fiscal_year order by sale desc) dense
from sales;

# ----- Percent rank rank -1 /total row-1
select *,
row_number() over(partition by fiscal_year order by sale desc) row_1,
rank() over(partition by fiscal_year order by sale desc)Rank_1,
dense_rank() over(partition by fiscal_year order by sale desc) dense,
percent_rank() over(partition by fiscal_year order by sale desc) P_rank
from sales;


#---------- LAG ---- LEAD--------
-- lag(expression / coumn name,, [ offsets],[default value]
--   over(partition by        order by   )
--   to find the previous year with current year lag will take previous no
 #---------- Lead -------
 
 #write a sql query to to compare the sales of a year with the previous one
 
 select *, 
 lag(sale,1,0) over(partition by sales_employee order by fiscal_year) as lag_col,
 sale-lag(sale,1,0) over(partition by sales_employee order by fiscal_year) as diff
 from sales;
  
 # for different between currnet and previous year sale
  select *, 
 lag(sale,1,0) over(partition by sales_employee order by fiscal_year) as next_year,
 sale-lag(sale,1,0) over(partition by sales_employee order by fiscal_year) as diff,
  percent_rank() over(partition by fiscal_year order by sale desc) P_rank
 from sales;
 
 
 with cte as 
 ( select *, 
 lag(sale,1,0) over(partition by sales_employee order by fiscal_year) as lag_col
 from sales)
 select sales_employee, fiscal_year,sale,lag_col,(sale-lag_col) as diff 
from cte;
 
 #lead --(expression / coumn name,, [ offsets],[default value]
--   over(partition by        order by   )
--   to find the NEXT year with current year lag will take next  no


select *, 
lead(sale, 1, 0) over(partition by sales_employee order by fiscal_year) as next_year
from sales;


with cte as(
select *, 
lead(sale, 1,0) over(partition by sales_employee order by fiscal_year) as next_year
from sales)
select *, sale-next_year, round(((sale-next_year)*100)/next_year,2)as round_year
from cte;




#---------- question------

#write a sql query  id, 