-- First subquery: Find the user with the most ratings
(SELECT name AS results
 FROM Users
 JOIN MovieRating USING (user_id)
 GROUP BY name
 ORDER BY COUNT(rating) DESC, name
 LIMIT 1)
UNION ALL
-- Second subquery: Find the highest-rated movie in February 2020
(SELECT title AS results
 FROM Movies
 JOIN MovieRating USING (movie_id)
 WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
 GROUP BY title
 ORDER BY AVG(rating) DESC, title
 LIMIT 1);
