use dummy;
#write  asql query to get th ecustomer details having credit limit > 80000
select * from customers;
select * from customers
where creditlimit>80000;

# having 

# without group by it will behave like where clause

select * from customers
having  creditlimit>80000;

#write a sql query to calculate the total sales for each yr
select * from orderdetails;
select * from orders;

select year(orderdate),sum(priceEach * quantityordered) as total from orderdetails  Oi
inner join orders using (ordernumber)
group by year(orderdate);
#///////        Imp ////////
# to find the <2003 yr sales
select year(orderdate) pyear,sum(priceEach * quantityordered) as total from orderdetails  Oi
inner join orders using (ordernumber)
group by pyear having pyear>2003;

# to find status which is shipped in 2004 and 2005

select status,year(orderdate) pyear,sum(priceEach * quantityordered) as total from orderdetails inner join orders using(ordernumber)
group by status,pyear having pyear>2003 and status="shipped";

# write a sqlm query to get theordernumbers, the no of item sold per order. and total sales for each orders from orderdetails table
select ordernumber, count(ordernumber),sum(priceEach * quantityordered) as total from orderdetails
group by ordernumber;

select ordernumber,sum(quantityordered) qty,sum(priceEach * quantityordered) as total from orderdetails
group by ordernumber having qty>500;

# sales <1000

select ordernumber,sum(quantityordered) qty,sum(priceEach * quantityordered) as total from orderdetails
group by ordernumber having total>1000;

select status,ordernumber,sum(quantityordered) qty,sum(priceEach * quantityordered) as total from orderdetails
inner join orders using(ordernumber)
group by status,ordernumber having status="shipped";


# write a sql query to get ordervalue summarize by productlines and years
select productline,year(orderdate) Pyear,sum(priceEach * quantityordered) as total from orders  Oi
inner join orderdetails using (ordernumber)
inner join products using (productcode)
group by productline,pyear;

#*****------- to create new table by output of the query  ( create table <table name> and write your sql query
create table output
select productline,year(orderdate) Pyear,sum(priceEach * quantityordered) as total from orders  Oi
inner join orderdetails using (ordernumber)
inner join products using (productcode)
group by productline,pyear;

