select d.name as department,
    e.name as employee,
    e.salary
from Employee e
join Department d
on e.departmentId = d.id 
where e.salary = (
        select max(salary)
        from Employee 
        where departmentId =e.departmentId
); 

