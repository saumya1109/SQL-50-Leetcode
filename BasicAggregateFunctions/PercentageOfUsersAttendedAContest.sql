# Write your MySQL query statement below

/*
Step 1: Calculate the total number of users
Step 2: Find the total participation for each contest
Step 3: Calculate the percentage of users who participated in each contest
Step 4: Sort the results by percentage in descending order and by contest_id
*/

WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users
    FROM Users
)

select r.contest_id,  round((count(distinct u.user_id)/tu.total_users)*100,2)
as percentage
from Users u
join TotalUsers tu
join Register r
on u.user_id=r.user_id
group by r.contest_id 
order by  percentage  desc, r.contest_id



--Without using join 

select contest_id, round(count(distinct user_id)*100.0 /(select count(user_id) from Users),2)
as percentage
from Register
group by contest_id
order by percentage desc, contest_id
