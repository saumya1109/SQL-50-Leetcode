/* Two things to check here is 
1. Dates are consecutive
2. Temperature is more than the previous day

*/

# Write your MySQL query statement below

select w1.id
from Weather w1
join Weather w2
on Datediff(w1.recordDate, w2.recordDate)=1
and w1.temperature>w2.temperature;