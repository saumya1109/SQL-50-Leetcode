Select employee_id, department_id
From Employee 
Where primary_flag='Y' or employee_id in
    (Select employee_id
    From Employee
    Group By employee_id
    Having Count(employee_id)=1)

