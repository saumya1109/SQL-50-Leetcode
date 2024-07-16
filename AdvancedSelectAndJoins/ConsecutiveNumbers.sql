/*Consecutive appearing means the Ids of the Num are next to each others. 
Since this problem asks for numbers appearing at least three times consecutively, 
we can use 3 aliases for this table Logs, and then check whether 3 consecutive numbers are all the same.

However, we need to add a keyword DISTINCT because 
it will display a duplicated number if one number appears more than 3 times consecutively.*/

# Write your MySQL query statement below
SELECT distinct l1.num as ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3

WHERE
        l1.id = l2.id-1
    and l2.id = l3.id-1
    and l1.num= l2.num
    and l2.num= l3.num