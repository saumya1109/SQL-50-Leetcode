/*
CONCAT(string1, string2, ...., string_n)
SUBSTRING(string, start, length)
LOWER(text)
UPPER(text)

*/

# Write your MySQL query statement below
select user_id, 
Concat(Upper(left(name,1)),Lower(SUBSTRING(name , 2, Length(name)-1))) as name
from Users
order by user_id

#Using left and right function

# Write your MySQL query statement below
select user_id, 
Concat(Upper(left(name,1)),Lower(Right(name ,Length(name)-1))) as name
from Users
order by user_id