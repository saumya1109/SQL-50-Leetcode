# Write your MySQL query statement below
/*MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. 
Anything compared to NULL evaluates to the third value: UNKNOWN. 
That “anything” includes NULL itself! 
That’s why MySQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
*/

select name from Customer where referee_id is null || referee_id !=2 ;



/*Using COALESCE(referee_id, 0) != 2 effectively handles NULL values by treating them as 0,
simplifying the query condition and ensuring that both NULL and non-2 values are included in the
*/

SELECT name 
FROM Customer
WHERE COALESCE(referee_id, 0) != 2;


# Another way
SELECT name 
FROM Customer
WHERE IFNULL(referee_id, 0) <>2;
