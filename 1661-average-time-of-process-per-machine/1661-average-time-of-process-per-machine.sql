select 
    machine_id,
    ROUND(avg(end_time - start_time)::numeric, 3) as processing_time
from(
    select
        machine_id,
        process_id,
        MAX(case when activity_type = 'end' THEN timestamp END) AS end_time,
        MAX(case when activity_type = 'start' THEN timestamp END) AS start_time
    from Activity
    group by machine_id, process_id
) t
group by machine_id;


