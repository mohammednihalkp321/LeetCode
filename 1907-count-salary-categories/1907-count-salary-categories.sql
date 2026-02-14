select category, count(a.account_id) as accounts_count
from (
    values
        ('Low Salary'),
        ('Average Salary'),
        ('High Salary')
) as c(category)
left join Accounts a
    on (
        (c.category = 'Low Salary' and a.income < 20000)
        OR
        (c.category = 'Average Salary' and a.income BETWEEN 20000 and 50000)
        or
        (c.category = 'High Salary' and a.income > 50000)
    )
group by category;

