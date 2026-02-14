with first_orders as (
    select
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() over (
            partition by customer_id
            order by order_date
        )as rank
    from Delivery
)
select
    cast(
        round(
            100.0 *
            sum( case when order_date = customer_pref_delivery_date then 1 ELSE 0 end)
            / count(*),
            2
        ) as numeric(10,2)
    ) as immediate_percentage
from first_orders
where rank = 1;

