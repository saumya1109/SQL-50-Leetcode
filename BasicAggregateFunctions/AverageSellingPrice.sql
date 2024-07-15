-- Write your MySQL query statement below

/*
First, consider the type of join to use. An inner join might fail in edge cases where a product doesn't have a start date or end date, so using a left join is beneficial to include all products. We can return 0 for null values.

Also, ensure the purchase date is between the start and end date.

Finally, apply the formula to calculate the average price.
*/

SELECT p.product_id, 
       IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
                     AND u.purchase_date >= p.start_date
                     AND u.purchase_date <= p.end_date
GROUP BY p.product_id;
