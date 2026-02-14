select
    s.user_id,
    cast(
        round(
         COALESCE(
         count(*) filter (where c.action = 'confirmed')::numeric
         / nullif(count(c.action), 0),
         0
        ),
        2
        ) as numeric (10,2)
    ) as confirmation_rate
from Signups s
left join Confirmations c
    on s.user_id = c.user_id
group by s.user_id;

