# Write your MySQL query statement below
select * from Cinema 
where id%2 <> 0 and description<> 'boring'
order by rating desc;


--We can also use MOD function here 
SELECT * 
FROM Cinema 
WHERE MOD( id, 2) = 1 
AND description <> 'boring' ORDER BY rating DESC