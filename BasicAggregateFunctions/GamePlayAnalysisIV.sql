--The DATE_SUB() function subtracts a time/date interval from a date and then returns the date.-- The DATE_SUB() function subtracts a time/date interval from a date and then returns the date.

-- Calculate the fraction of players who logged in the day before their first login date.
SELECT 
    ROUND(COUNT(player_id) / (
        -- Subquery to count the total number of distinct players
        SELECT COUNT(DISTINCT player_id) 
        FROM Activity
    ), 2) AS fraction 
FROM 
    Activity
WHERE 
    -- Check if the combination of player_id and the previous day of the event_date
    (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
        -- Subquery to find the first login date for each player
        SELECT 
            player_id, 
            MIN(event_date) AS first_login_date
        FROM 
            Activity
        GROUP BY 
            player_id
    );

	
	
	
	
#Another solution
-- Another solution using a common table expression (CTE) to calculate total users first.
-- Calculate the fraction of players who logged in the day before their first login date.
-- Check if the combination of player_id and the previous day of the event_date
 -- Subquery to find the first login date for each player

WITH totalUsers AS (
    -- Subquery to count the total number of distinct players
    SELECT COUNT(DISTINCT player_id) AS total_users
    FROM Activity
)


SELECT 
    IFNULL(ROUND(COUNT(player_id) / t.total_users, 2), 0) AS fraction 
FROM Activity
JOIN totalUsers t
WHERE 
  (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
        SELECT 
            player_id, 
            MIN(event_date) AS first_login_date
        FROM 
            Activity
        GROUP BY 
            player_id
    );
