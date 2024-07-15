# Write your MySQL query statement below

/*
We want everything from the left table (Project), hence using a LEFT JOIN.

Then, we need to group the results by project_id.

Finally, we apply the formula to calculate the average experience years for each project.
*/

SELECT p.project_id, 
       ROUND(SUM(e.experience_years) / COUNT(p.project_id), 2) AS average_years
FROM Project p
LEFT JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;




-- We can also use avearge function here

select p.project_id, round(avg(e.experience_years),2)
as average_years
from Project p
left join Employee e
on p.employee_id= e.employee_id
group by p.project_id 
