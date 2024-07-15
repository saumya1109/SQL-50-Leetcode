# Write your MySQL query statement below
select 
	round(sum(if(order_date = customer_pref_delivery_date ,1,0))*100.0/count(distinct customer_id),2) as immediate_percentage
from Delivery
where(customer_id, order_date) in ( 
    select customer_id, MIN(order_date) as first_order_date
    from Delivery
    group by customer_id)
	
	
-- Using CASE
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT customer_id), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
);
