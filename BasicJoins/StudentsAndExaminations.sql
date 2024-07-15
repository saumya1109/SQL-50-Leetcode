# Write your MySQL query statement below
select s.*, sb.subject_name, 
count(ex.subject_name) as attended_exams
From Students s
cross join Subjects sb
left join Examinations ex
on s.student_id= ex.student_id
and sb.subject_name = ex.subject_name
group by s.student_id, s.student_name, sb.subject_name
order by s.student_id ASC, sb.subject_name,count(ex.subject_name) DESC