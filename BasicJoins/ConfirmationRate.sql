-- Write your MySQL query statement below

/*
Before solving a problem, try to think about what data is needed. 
Here, we would want everything from the left table (Signups) and use a LEFT JOIN 
to include all users even if they have no confirmations.

We will group by user_id since we want to see each user only once.
To calculate the confirmation rate, we use an aggregate function to compute the ratio 
of confirmed actions to total actions, rounded to two decimal places.
*/

SELECT s.user_id, 
       IFNULL(ROUND(SUM(c.action = 'confirmed') / COUNT(*), 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;