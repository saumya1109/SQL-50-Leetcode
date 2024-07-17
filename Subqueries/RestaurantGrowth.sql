-- First task is to find the min date and then have incremented 6 days interval

SELECT 
    c.visited_on,
    -- Calculate the total amount for the 7-day interval ending on c.visited_on
    (SELECT SUM(amount)
     FROM Customer
     WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on) AS amount,
    -- Calculate the average amount over the 7-day interval and round it to 2 decimal places
    ROUND((SELECT SUM(amount) / 7
           FROM Customer
           WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on), 2) AS average_amount
FROM 
    Customer c
WHERE 
    c.visited_on >= (
        -- Find the date which is the minimum visited_on date plus 6 days
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM Customer
    )
GROUP BY 
    c.visited_on;
