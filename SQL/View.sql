#------ VEIW -----
# IN VEIW QUERY SAVE AND IT WILL SAVE STORAGE 
# RENAME,  DROP , CREATE 
# ek view se hum again view create kr skte h and multiple view join kr skte h 
# --- create view (view name ) as
use dummy;


# write a sql query that return customername, chequeno, paymentdate and amount
select * from payments;

# create view
create view customerpayments as
select customername, customernumber, checknumber, paymentdate,amount
from customers c
inner join  payments using (customernumber);


#rename view
rename table customerpayments to cust_payment;
select * from cust_payment;


#drop view
drop view cust_payment;

show full tables;

#write a sql query to create a view that represent totalsales per order;
select * from orderdetails;

select orderNumber,sum(priceeach*quantityordered) as totalsales from orderdetails
group by ordernumber;

use dummy;
# customerno, customername, orderstatus

create view  cust_order as 
select customernumber,customername,orderdate,status,sum(priceeach*quantityordered) as totalsales 
from customers 
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
group by customernumber,customername,orderdate,status
order by orderdate;

select * from cust_order;

# we can give name in view by ourself 
create view  cust1 (
cname, cno,odate,status,totalsalesas ) as
select customernumber,customername,orderdate,status,sum(priceeach*quantityordered) 
from customers 
inner join orders using (customernumber)
inner join orderdetails using (ordernumber)
group by 1,2,3,4;

select * from cust1;


# ------ 
use windowFn;
select * from sales;