# Write your MySQL query statement below
with cte as
(
    select spend_date, 'mobile' as platform from Spending
    union
    select spend_date, 'desktop' as platform from spending
    union
    select spend_date, 'both' as platform from spending
),
cte1 as
(
    select *,
    case when count(distinct platform) = 1 then platform
    when count(distinct platform) = 2 then 'both' end as platform1,
    sum(amount) as amt
    from Spending
    group by spend_date, user_id
)

select c.spend_date, c.platform, sum(coalesce(c2.amt,0)) total_amount, count(distinct user_id) total_users
from cte c left join cte1 c2
on c.spend_date = c2.spend_date
and c.platform = c2.platform1
group by spend_date, platform


