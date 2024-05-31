# ------ Stored Procedures------
-- Create Procedure [Procedure Name] ([Parameter 1], [Parameter 2], [Parameter 3] )
-- Begin
-- SQL Queries..
-- End
use dummy;
#write a sql query that return the customername, city, state, postalcode and country
select * from customers;


select customername, city, state, postalCode,country from customers
order by customername;


delimiter $$
create procedure get_cust_info ()
begin 
select customername, city, state, postalCode,country from customers
order by customername;
End $$
delimiter ;


delimiter $$
create procedure get_cust_info1 ()
begin 
select customername, city, state, postalCode,country 
from customers
where country="USA"
order by customername;
End $$
delimiter ;

call get_cust_info1();

delimiter $$
create procedure get_cust_info2( in country varchar(50))
begin 
select customername, city, state, postalCode,country 
from customers c
where c.country= country
order by customername;
End $$
delimiter ;
call get_cust_info2("japan");

# create store proce. to get the information of all product input paramet is productline
select * from products;
delimiter $$
create procedure get_product_info2( in p_line varchar(50))
begin 
select * from products p
where p.productline=p_line;
End $$
delimiter ;

call get_product_info2("Motorcycles");

use dummy;
delimiter $$
create procedure get_cust_info2( in country varchar(50))
begin 
select customername, city, state, postalCode,country 
from customers c
where c.country= country
order by customername;
End $$
delimiter ;
call get_cust_info2("japan");

# create store proce. to get the information of all product input paramet is productline
select * from products;
delimiter $$
create procedure get_product_info2( in p_line varchar(50))
begin 
select * from products p
where p.productline=p_line;
End $$
delimiter ;

delimiter $$
create procedure get_cust_info6( in country varchar(50),
in creditlimit decimal(10,2))
begin 
select customername, city, state, postalCode,country 
from customers c
where c.country= country
order by customername;
select customernumber,customername from customers c 
where c.creditlimit>=creditlimit;
End $$
delimiter ;
call get_cust_info6("japan",10000);

select * from offices;

# question: - write a store procedure that find all offices that are located in are country specified by the inpute parameter
delimiter $$
create procedure get_office(in country varchar(20))
begin
select * from offices o
where o.country=country;
End $$
delimiter ;
call get_office("Japan");


# OUT 

delimiter $$

create procedure getorder (in orderstatus varchar(20),out total int)
begin
select count(orderstatus) into total
from orders o where o.status=orderstatus;
end $$
delimiter $$;

call getorder("shipped", @total);

select @total as totalshipped;
