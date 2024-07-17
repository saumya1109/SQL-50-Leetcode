
SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

#Using Joins
SELECT max(e1.salary) as  SecondHighestSalary 
FROM Employee e1 join Employee e2
on e1.salary < e2.salary

#Using Offset
# Write your MySQL query statement below
select (
Select  distinct salary 
from Employee
order by salary desc
limit 1
offset 1) as SecondHighestSalary