#----- String Function---------
Use Dummy;
#left(string,lenth)
select left("Welcome To Cybrom",3);

#(string,lenth)
select Right("Welcome To Cybrom",7);

#Substing ( string, position,lenth)
select substring("Welcome To Cuybrom",3,7);

#giving the frist occurane in the string   ----- instr( string, substring)
select Instr("Welcome To Cybrom","Welcome");

select Instr("Welcome To Cybrom","o");

select upper("Welcome To Cuybrom");

select lower("Welcome To Cybrom");

select trim("Welcome To Cybrom ");


# to find the product whose name contense the car key word

select * from products
where productname like "%Car%";

select * from Products
where instr(productname,"Car");


Create index product_idx on products(productname);
 
 explain select Productname from products
 where productname like "1900%";
 
 explain  select productname from products where instr(productname,"1900");