with cte as (
    select fail_date as event_date, 'failed' as state from failed
    union
    select success_date as event_date , 'succeeded' as state from succeeded
),cte1 as (
select *, row_number() over(partition by state order by event_date) as rn
from cte
where year(event_date) = 2019
)

select state as period_state,
min(event_date) as start_date,
max(event_date) as end_date
from cte1
group by date_sub(event_date, interval rn day),1
order by start_date

