# Write your MySQL query statement below
select p.product_name, sum(o.unit) as unit
from Products p 
join Orders  o
on p.product_id= o.product_id
where o.order_date < "2020-03-01" and 
 o.order_date > "2020-01-31"
group by product_name 
having sum(o.unit) >=100


# Write your MySQL query statement below
select product_name, sum(unit) as unit
from Products p 
join Orders  o
using (product_id)
where month(order_date)=2 and year(order_date) =2020
group by product_name 
having unit >=100
