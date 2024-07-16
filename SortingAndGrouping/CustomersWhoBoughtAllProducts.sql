# Write your MySQL query statement below


/*

distinct product keys -- 5,6

customer_id  1--> 5,6
customer_id  2-->6
customer_id  3--> 5,6

We need to return the customer IDs of those who have purchased all the distinct product keys available in the Product table.

*/
-- Select the customer IDs of those who have purchased all distinct product keys available in the Product table
SELECT customer_id
FROM Customer
GROUP BY customer_id
-- Ensure the count of distinct product keys for each customer matches the total distinct product keys in the Product table
HAVING COUNT(DISTINCT product_key) = (
    -- Subquery to count the total number of distinct product keys in the Product table
    SELECT COUNT(DISTINCT product_key)
    FROM Product
);
