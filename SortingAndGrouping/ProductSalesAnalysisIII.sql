# Write your MySQL query statement below

/*To get the correct quantity and price for the first_year of each product, 
we need to select the row with the minimum year for each product. 
This requires a subquery or a join to ensure you get the correct row.*/

select 
    product_id,
    year as first_year,
    quantity,
    price
from Sales
where (product_id, year) in

    (select product_id, min(year) 
    from Sales
    group by  product_id
    );
