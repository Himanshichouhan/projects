use dummy;
#Querying Data: SELECT and SELECT FROM
#---Write a SQL query to retrieve the name, email, and phone columns from the customers table.

select customername,phone from customers;

#----Write a SQL query to retrieve all columns and rows from the orders table.
select * from orders;

#Sorting Data: ORDER BY
#--Write a SQL query to retrieve all products sorted by price in ascending order.
select * from products
order by buyprice asc;
#-Write a SQL query to retrieve the top 5 orders sorted by order_date in descending order.

select * from orders order by orderdate desc;

# ******Filtering Data: WHERE, SELECT DISTINCT, AND, OR, IN, NOT IN, BETWEEN
#Write a SQL query to retrieve all customers from the customers table where the city is 'New York' and the state is 'NY'.
select * from customers
where city="New York" and state="NY";

#   ******* Write a SQL query to retrieve all distinct category values from the products table.
#Write a SQL query to retrieve all orders where the order_date is between '2023-01-01' and '2023-12-31'.
select * from orders 
where orderdate between 2023-01-01 and '2023-12-31';

#Write a SQL query to retrieve all products where the category is in ('Electronics', 'Clothing').
select * from products
where productline= "Motorcycles" or productline="Vintage";

#------Filtering Data: IS NULL, LIKE, LIMIT
#Write a SQL query to retrieve all customers where the email is NULL.
select * from customers
where state is null;

#Write a SQL query to retrieve all customers where the name starts with 'J'.
select * from customers
where customername like "A%";

#--Write a SQL query to retrieve the first 10 rows from the orders table.
select * from orders limit 10;

#--------Joining Tables: JOINS (INNER, LEFT, RIGHT, CROSS, NATURAL, SELF JOIN)
# Write a SQL query to retrieve the name, order_date, and total from the customers and orders tables using an INNER JOIN.
select customername,orderdate,sum(priceEach*quanityordered) as total from orders
inner join orderdetails  using(ordernumber)
inner join customers using (customernumber);

#Write a SQL query to retrieve the name, order_date, and total from the customers and orders tables using a LEFT JOIN.

#Write a SQL query to retrieve the employee_name and their manager_name from the employees table using a SELF JOIN.



Joining Tables: JOINS (INNER, LEFT, RIGHT, CROSS, NATURAL, SELF JOIN)
Write a SQL query to retrieve the name, order_date, and total from the customers and orders tables using an INNER JOIN.
Write a SQL query to retrieve the name, order_date, and total from the customers and orders tables using a LEFT JOIN.
Write a SQL query to retrieve the employee_name and their manager_name from the employees table using a SELF JOIN.
Grouping Data: GROUP BY, HAVING, ROLLUP
Write a SQL query to retrieve the category and the count of products for each category.
Write a SQL query to retrieve the category and the total quantity of products for each category, where the total quantity is greater than 100.
Write a SQL query to retrieve the category and the total quantity of products, including subtotals for each category.