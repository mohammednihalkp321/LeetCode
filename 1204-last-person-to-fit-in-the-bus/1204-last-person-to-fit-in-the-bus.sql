select  person_name
from (
   select 
        person_name,
        SUM(weight) OVER (order by turn) AS total_weight
    from Queue
) t
where total_weight <= 1000
order by total_weight desc
limit 1;

