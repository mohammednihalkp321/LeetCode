with log_cte as(
    select id,
        num,
        lag(num,1) over(order by id) as previous1,
        lag(num,2) over(order by id) as previous2
    from logs
) 
select distinct num as ConsecutiveNums
from log_cte
where num = previous1
    and num = previous2;

