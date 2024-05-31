#------- Data Function ----------
use dummy;
#now() To find current tenure and find the diference between the perious year to till now 
select now();

Select sysdate();
 
select current_time();

select now(),sleep(5),now();

select sysdate(),sleep(5),sysdate();

select utc_timestamp();

select utc_time();

select convert_tz("2024-05-04 08:21:48",'+00:00','-04:00');


#write a sql query to that return orderdate, total order value and product name.by each year

select * from orderdetails;
select year(orderdate) as Order_year,sum(priceEach*quantityordered) As Total_value, productname 
FROM 
    orders
JOIN 
    orderdetails using (ordernumber)
JOIN 
    products using (productcode)
GROUP BY YEAR(orderdate), productname
ORDER BY 
     Order_year, Total_value ;

# write a sql query that return the order volumne by month in 2004
select * from orders;
select month(orderdate) As order_month, count(orderNumber)  from orders 
WHERE 
    year(orderdate) = 2004
    group by month(orderdate);
    
    # write a sql query to retrive the no of orders shipped per year;
    select * from orders;
    select year(orderdate) As Order_year,count(orderNumber) from orders
    where status="Shipped" is not null
    group by Order_year
    ;


#select data type kn liye agr hume csv m date or timing chnage krn ah hto 



select str_to_date('21,5,2013','%D,%M,%Y');

select str_to_date('239','%h');