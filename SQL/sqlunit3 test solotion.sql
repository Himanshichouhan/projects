create database sql19batch;
use sql19batch;
CREATE TABLE sales (
sales_id INT PRIMARY KEY,
sales_rep_name VARCHAR(50),
product_id INT,
order_date DATE,
total_sales DECIMAL(10, 2),
region VARCHAR(50)
);

INSERT INTO sales (sales_id, sales_rep_name, product_id, order_date, total_sales, region) VALUES
(1, 'John Doe', 101, '2023-01-15', 1500.00, 'North'),
(2, 'Jane Smith', 102, '2023-01-20', 2000.00, 'South'),
(3, 'John Doe', 103, '2023-02-10', 2500.00, 'North'),
(4, 'Jane Smith', 104, '2023-02-18', 3000.00, 'South'),
(5, 'John Doe', 105, '2023-03-05', 1800.00, 'North'),
(6, 'Jane Smith', 106, '2023-03-12', 2200.00, 'South'),
(7, 'John Doe', 101, '2022-01-15', 1600.00, 'North'),
(8, 'Jane Smith', 102, '2022-01-20', 2100.00, 'South'),
(9, 'John Doe', 103, '2022-02-10', 2600.00, 'North'),
(10, 'Jane Smith', 104, '2022-02-18', 3100.00,'South');

select * from sales;


# question and answer 
-- QUES. 1 Write a SQL query to rank sales representatives based on
-- their total sales within each region.
-- The result should include the sales representative's name, region,
-- total sales, and their rank within the region.
-- Calculating Running Total of Sales

select sales_rep_name,region, sum(total_sales) as TotalSales,
rank() over( partition by region order by sum(total_sales)) as runningtotal
from sales
group by 1,2
order by region,TotalSales;

-- Ques. 2 Write a SQL query to calculate the running total of sales for
-- each month in the year 2023.
-- The result should include the month, total sales for the month, and
-- the running total up to that month.
select * from sales;
select month(order_date) as monthdate,sum(total_sales) as Totalsales,
sum(sum(total_sales)) over( order by month(order_date)) as running_total
from sales
where year(order_date)=2023
group by month(order_date);

# by sir formate to correct the date formate in this question
select date_format(order_date,'%Y-%M') as month,
sum(total_sales) as Totalsales,
sum(sum(total_sales)) over( order by date_format(order_date,'%Y-%M')) as running_total
from sales
where year(order_date) = 2023
group by date_format(order_date,'%Y-%M');


-- Ques3 Year-Over-Year Sales Growth
-- Write a SQL query to calculate the year-over-year sales growth for
-- each product. The result should include the product ID, the year, the
-- total sales for the year, and the year-over-year growth percentage.
select * from sales;
# cte 
with cte  as( 
select product_id,year(order_date) as year,sum(total_sales) as sales,
lead(sum(total_sales),1,0) over(partition by product_id order by year(order_date)) as Next_year 
from sales
group by product_id, year(order_date)
order by year(order_date))
select product_id,year,sales,
  CASE
        WHEN sales = 0 OR next_year = 0 THEN 0  -- Avoid division by zero
        ELSE ((next_year - sales) / sales) * 100
    END AS growth_sales
    from cte;


# with subqueries 

select product_id,year,sales,
  CASE
        WHEN sales = 0 OR next_year = 0 THEN 0  -- Avoid division by zero
        ELSE ((next_year - sales) / sales) * 100
    END AS growth_sales
    from (select product_id,year(order_date) as year,sum(total_sales) as sales,
lag (sum(total_sales),1,0) over(partition by product_id order by year(order_date)) as Next_year 
from sales
group by product_id, year(order_date)
order by year(order_date)) 
as year_sales
group by product_id,year;


-- Question: Write a SQL query to identify the top 3 performing
-- products in terms of total sales for each quarter of the year 2023.The
-- result should include the product ID, quarter, total sales for the
-- quarter, and the rank within the quarter.
with cte as (
select product_id, quarter(order_date) as quart_date,
sum(total_sales) as sales from sales
where year(order_date)=2023
group by product_id,quarter(order_date))
select 
product_id,quart_date,sales,
rank() over(partition by quart_date order by sales desc ) as sales_rank
from cte
-- where sales_rank <=3
group by 1,2,3
order by sales_rank limit 3;


CREATE TABLE product_sales (
    product_id INT PRIMARY KEY,
    category VARCHAR(50),
    sales_amount int );
    
INSERT INTO product_sales (product_id, category, sales_amount) VALUES
(101, 'Electronics', 1500),
(102, 'Electronics', 2000),
(103, 'Furniture', 2500),
(104, 'Furniture', 3000),
(105, 'Electronics', 1800),
(106, 'Furniture', 2200),
(107, 'Electronics', 1600),
(108, 'Furniture', 2100),
(109, 'Electronics', 2600),
(110, 'Furniture',3100);
select * from product_sales;

-- Ques5. Average and Median Sales by Category
-- Question: Write a SQL query to calculate the average and median
-- sales amount for each product category.

select distinct category,avg(sales_amount) as avg_amount,
avg(sales_amount) over(partition by category order by avg(sales_amount)) as average_amount;




#v ------ calss test sql 
#write a sql query to the client who have spend the most amount of money
use dummy;
select customername, sum(amount) as total from customers
inner join payments using (customernumber)
group by customername
order by total desc limit 20;


# write a sql query that return the name of product that were purchase most by customer.
select customername, productname,count(customernumber) as total_count, sum(priceeach*quantityordered) as Revenue
from customers
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
inner join products using (productcode)
group by productname,customername
order by total_count desc;

#to find avg amount of payment collected from sales by eah employees
select concat(firstname," ",lastname) as fullname,customername,avg(amount) as avg_amount
from employees e
inner join customers c on e.employeenumber=c.salesrepemployeenumber
inner join payments using (customernumber)

group by 1,2
order by avg_amount desc;


# to find that return customername for the minimum payment that received each month
select customername,min(paymentdate)as min_payment,month(paymentdate) as monthly_payment,sum(amount)
from customers
inner join payments using (customernumber)
group by 1,3
order by min_payment;