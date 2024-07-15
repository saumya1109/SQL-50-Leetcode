/*
Group by the query_name so that we get one result per query.

To calculate the quality score, we can use the average function directly for (rating/position).

For the poor query percentage, use an IF condition to count queries with a rating below 3 as 1 and those above or equal to 3 as 0, 
then take the average and multiply by 100 to get the percentage.
*/

# Write your MySQL query statement below

select q.query_name
, round((sum(q.rating/q.position))/count(query_name),2)
as quality
, round(avg(if(rating<3,1,0))*100,2) as poor_query_percentage
from Queries q
where q.query_name is not null
group by  q.query_name


# Write your MySQL query statement below
select q.query_name
, round(avg(q.rating/q.position),2)
as quality
, round(avg(if(rating<3,1,0))*100,2) as poor_query_percentage
from Queries q
where q.query_name is not null
group by  q.query_name