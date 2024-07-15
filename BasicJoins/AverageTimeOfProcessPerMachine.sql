# Write your MySQL query statement below
select a1.machine_id, round(AVG(a2.timestamp - a1.timestamp),3) as processing_time 
from Activity a1
join Activity a2
where a1.process_id = a2.process_id
and a1.machine_id= a2.machine_id
and a1.timestamp< a2.timestamp
group by a1.machine_id;



#Another way

/*For this approach, call the original table twice, once as the table that stores "start" timestamps and once as "end" timestamps. 
To create the table alias, we give the original table Activity two different names, and filter each table by the activity_type.
Make sure the two tables are joined on the machine_id and process_id, so the output will have the start timestamp and end timestamp stored in two different columns for each machine and process.
 
 
 SELECT (b.timestamp - a.timestamp) AS processing_time
 
 the apply the avg and round function
 */



SELECT a.machine_id, 
       ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'
GROUP BY machine_id
	
