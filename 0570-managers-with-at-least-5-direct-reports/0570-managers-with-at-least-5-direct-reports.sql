select 
    e.name
from employee e
join employee m
on e.id = m.managerId
group by e.name,e.id
having count(m.id) >=5 ;        
