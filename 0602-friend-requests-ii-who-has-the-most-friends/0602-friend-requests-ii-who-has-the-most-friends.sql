select
    id,
    count(*) AS num
from (
 select requester_id AS id FROM RequestAccepted
 union all
 select accepter_id AS id FROM RequestAccepted
) t
group by id
order by num desc
limit 1;

