select
    to_char(trans_date, 'YYYY-MM') as month,
    country,
    count(*) AS trans_count,
    sum(case when state = 'approved' then 1 ELSE 0 END) as approved_count,
    sum(amount) AS trans_total_amount,
    sum(case when state = 'approved' then amount ELSE 0 END) as approved_total_amount
from Transactions
group by
    to_char(trans_date, 'YYYY-MM'),
    country;
