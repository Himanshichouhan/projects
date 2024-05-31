#-------ROLL UPS ------
SELECT * FROM OUTPUT;

select productline,sum(total) from output group by productline;

select productline,sum(total) from output group by productline
union
select null, sum(total) from output;

# ^^^^^ with help of roll up we can easily find grand total
# what ever we giv ein aggregate they will give you superaggregate in this exam we have take (sum) 
select productline,sum(total) from output group by productline with rollup;

select productline,pyear,sum(total) from output group by pyear,productline with rollup;

use dummy;

# ------ practise question ------
 select * from output;  
 
 # to fing each year each product avg of total
 select pyear, avg(total) from output
 group by pyear;
 
 select * from products;
 select productline,pyear,avg(total) from output group by pyear,productline with rollup
 # 
 