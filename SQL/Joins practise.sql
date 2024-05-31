use dummy;

select * from customers;
select * from orders;


select customernumber,customername, orderdate,status 
from customers C1
inner join orders O 
on C1.customernumber=O.customernumber;


# c.customernumber to give exact detail to engine because it is common values in both table
select C1.customernumber,customername, orderdate,status, 
(priceeach*quantityordered) as total 
from customers C1
inner join orders O 
on C1.customernumber=O.customernumber
inner join orderdetails oi
on O.ordernumber=oi.ordernumber; 


# ===== left join 


select C1.customernumber,customername, orderdate,status 
from customers C1
left join orders O 
on C1.customernumber=O.customernumber;

select count(C1.customernumber)
from customers C1
left join orders O 
on C1.customernumber=O.customernumber;

select count(*)
from customers C1
left join orders O 
on C1.customernumber=O.customernumber;

## left exclusive

select C1.customernumber,customername, orderdate,status 
from customers C1
left join orders O 
on C1.customernumber=O.customernumber
where O.customernumber is null;


#======= after holi vacation =======

# quesdtion 
# customer table custoner number, orderdates, product codes, priceeach, product name, productline.
 
select * from orders;
select * from customers;
select * from orderdetails;
select * from products;

select C1.customernumber,orderdate,oi.productcode, priceeach,Productname,productline 
from customers C1
inner join orders O 
on C1.customernumber=O.customernumber
inner join orderdetails oi
on O.ordernumber=oi.ordernumber
inner join products P
on oi.productcode=p.productcode;



# id column name is same then we can use (USING) insted of (ON)

select C1.customernumber,orderdate,oi.productcode, priceeach,Productname,productline 
from customers C1
inner join orders O using (customernumber)
inner join orderdetails oi using (ordernumber)
inner join products P using (productcode);



#    practise 
 select customernumber,customername,orderdate,status,amount 
 from customers C1
 inner join orders O using (customernumber)
 inner join payments P using (customernumber);
use dummy;

select orderdate,C1.customernumber,customername,status,amount 
 from customers C1
 inner join orders O on C1.customernumber=O.customernumber
 inner join payments P on P.customernumber=C1.customernumber;
#======== /////   SELF JOINS /////===
# self join has no syntax we can operate it by left join and right joins
# it is applied only in that condition where one table connect too multiple column

select * from employees;


### question 
# orderdate from ordertable , priceeach *quantity order , product name . product code. 
select * from orders;
select * from products;
select * from orderdetails;

select orderdate,productname,oi.productcode,(priceeach*quantityordered) as total
from orders O 
inner join orderdetails oi using (ordernumber)
inner join products P using (productcode);


select * from products P inner join orderdetails oi using (productcode);


#----- test 2 of sql day 2 

SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    products p
JOIN
    orderdetails oi ON p.productcode = oi.productcode
JOIN
    categories c ON p.category_id = c.category_id
GROUP BY
    c.category_name
HAVING
    SUM(oi.quantity * oi.unit_price) > 1000
ORDER BY
    total_revenue DESC;

