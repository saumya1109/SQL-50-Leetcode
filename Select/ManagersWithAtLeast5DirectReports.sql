# Write your MySQL query statement below

/*
We can join the table with itslelf on the basis of the id that are used as managerId
and group them when the count is greater than 5
*/
select e1.name
from Employee e1
inner join Employee e2
on e1.id= e2.managerId
group by e2.managerId
having count(e2.managerId)>=5 ;


#Using subquery

select name from Employee where id in (
select distinct(managerId) from Employee group by managerId
 having count(managerId) >= 5)