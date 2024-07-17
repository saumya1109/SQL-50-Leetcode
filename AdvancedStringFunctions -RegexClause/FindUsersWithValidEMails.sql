# Write your MySQL query statement below
Select *
from Users
Where mail REGEXP '^[a-zA-Z][A-Za-z0-9_.-]*@leetcode[.]com$'
