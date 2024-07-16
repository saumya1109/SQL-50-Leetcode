# Write your MySQL query statement below


Select product_id, new_price as price 
From Products
Where (product_id, change_date) in
    (Select  product_id, max(change_date)
    From Products
    where change_date <="2019-08-16"
    group by product_id
    )
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN 
    (SELECT product_id 
    FROM Products 
    WHERE change_date <= '2019-08-16');



