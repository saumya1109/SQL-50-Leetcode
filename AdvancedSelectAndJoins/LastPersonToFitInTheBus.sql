# Write your MySQL query statement below

Select q1.person_name
From Queue q1 
Inner Join Queue q2
on q1.turn>= q2.turn
group by q1.turn
having sum(q2.weight) <=1000
order by sum(q2.weight) DESC
limit 1
