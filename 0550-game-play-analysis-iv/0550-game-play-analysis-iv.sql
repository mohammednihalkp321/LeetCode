with first_login as (
    select 
        player_id,
        min(event_date) as first_date
    from activity
    group by player_id    
),
next_day_login as(
    select distinct f.player_id
    from first_login f
    join activity a
    on a.player_id = f.player_id
    and a.event_date = f.first_date + interval '1 day'
)
select 
    cast(
        round(
            count(n.player_id)::numeric
            / (select count(distinct player_id) from activity),2
        ) as numeric(10,2)
    ) as fraction
from next_day_login n;    
