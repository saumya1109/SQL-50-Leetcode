# Write your MySQL query statement below

select p.product_name,s.year,s.price
From Sales s join Product p on 
s.product_id= p.product_id;


#Another way to solve this is using "Using function"
select p.product_name,s.year,s.price
From Sales s 
join Product p 
using (product_id);