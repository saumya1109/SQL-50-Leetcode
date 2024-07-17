/*

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;



*/

# Write your MySQL query statement below

Select
    Case
        When 
            id =(select max(id) from Seat) And MOD(id,2) =1
            Then id
        When
            mod(id,2)=1
            Then id+1
        Else
            id-1
    END as id, student
From Seat
Order by id



