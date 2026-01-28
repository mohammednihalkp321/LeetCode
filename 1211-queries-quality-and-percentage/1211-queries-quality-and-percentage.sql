select
    query_name,
    ROUND(AVG(rating::numeric / position), 2) as quality,
    ROUND(
        100.0 * COUNT(*) filter (where rating < 3) / COUNT(*),
        2
    ) as poor_query_percentage
from Queries
group by query_name
order by quality desc;


