# Write your MySQL query statement below

select 
    e1.employee_id,
    e1.name, 
    count(e1.employee_id) as reports_count,
    Round(AVG(e2.age)) average_age 
from Employees e1
inner join Employees e2
on e1.employee_id = e2.reports_to
group by  employee_id
order by  e1.employee_id
