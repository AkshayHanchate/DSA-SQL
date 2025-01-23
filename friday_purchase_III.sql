# Write your MySQL query statement below
with cte1 as (
    select * from 
    (
        select 1 as week_of_month union all
        select 2 union all
        select 3 union all
        select 4 
    ) as weeks
    cross join (
        select 'Premium' as membership union all
        select 'VIP'
    ) as types
) ,
cte as (

select CEIL((DAY(p.purchase_date) + WEEKDAY(DATE_FORMAT(p.purchase_date, '%Y-%m-01'))) / 7.0) AS week_of_month, 
    u.membership,
    sum(p.amount_spend) as total_amount_spend 
    from purchases p
    left join Users u 
    on p.user_id = u.user_id
    where weekday(purchase_date) = 4
    group by week_of_month,membership
)

select c1.week_of_month, c1.membership,
Coalesce(c.total_amount_spend,0) as total_amount
from cte1 c1 left join 
cte c on 
c1.week_of_month = c.week_of_month and c1.membership = c.membership
order by week_of_month, membership
