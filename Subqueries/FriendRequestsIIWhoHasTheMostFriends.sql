-- Combine requester_id and accepter_id into a single column to count the number of friends per user
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS friend_count
-- Group by user ID to count the number of friends for each user
GROUP BY id
-- Order by the number of friends in descending order and limit the result to the top user
ORDER BY num DESC
LIMIT 1;
