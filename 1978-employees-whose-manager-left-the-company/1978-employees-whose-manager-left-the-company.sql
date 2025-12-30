select employee_id
From Employees   
Where
    salary < 30000 AND
    manager_id IS NOT NULL AND
    manager_id NOT IN (
         select employee_id from employees)
ORDER BY
employee_id;
