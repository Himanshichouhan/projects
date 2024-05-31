#******** control flow statements ******** 
use dummy;
select customername,count(ordernumber) from customers c 
inner join orders o using (customernumber)
group by customername;

select customername,count(*) as ordercount from customers c 
inner join orders o using (customernumber)
group by customername
order by ordercount desc;

#slow control case 1 
use dummy;

with cte as (
select customername,count(*) as ordercount from customers c 
inner join orders o using (customernumber)
group by customername)
select customername,ordercount, case ordercount
when 1 then "onetime customer"
when 2 then "repeated customer"
when 3 then "frequent customer"
else "loyal customer"
end customertype
from cte;

#----- with if 
with cte as (
select customername,count(*) as ordercount from customers c 
inner join orders o using (customernumber)
group by customername)
select customername,ordercount,
if(ordercount=1,"Onetime Customer",
if( ordercount=2,"Repeated Customer",
if(ordercount=3,"Frequently Customer","loyal customer"))) as customertype
from cte;

# question 1 write a sql query to calculate the totaL of sales order by order status
select * from orders;
select
sum( case when status="Shipped" then 1 else 0 end ) as "shipped",
sum( case when status="Cancellede" then 1 else 0 end ) as "Cancelled",
sum( case when status="On Hold" then 1 else 0 end ) as "Hold",
sum( case when status="Resolved" then 1 else 0 end ) as "Resolved",
sum( case when status="Dispute" then 1 else 0 end ) as "Dispute",
sum( case when status="In Process" then 1 else 0 end ) as "Process",
count(*) as Total from orders;

#---- with if conditions 
select
sum( if( status="shipped",1,0) ) as "shipped",
sum( if( status="Cancelled",1,0) ) as "Cancelled",
sum( if( status="On Hold",1,0) ) as "Hold",
sum( if( status="Resolved",1,0) ) as "Resolved",
sum( if( status="Disputed",1,0) ) as "Dispute",
sum( if( status="In Process",1,0) ) as "Process",
count(*) as Total from orders;




# question 2 write a sql query to fetch customer name , state , country from customer table , 
#uses the case expression to sort customers by state if state - if state is not null or sort the country is state is null.
select * from customers;
select customername, state,country from customers
order by (case when state is null then country else state end );

#--- with if conditions
select customername,state,country
from customers
order by if(state is null ,Country,State);

select customername,ifnull(state,"NA"),country
from customers;

select ifnull(status,"Total"),
count(*) from orders group by status with rollup;

#__________ h w to find same stauts relaztion by if conditions 
use dummy;
select * from orders;

#   -------- with if condition customer type
select * from customers;
select * from orders;


 



