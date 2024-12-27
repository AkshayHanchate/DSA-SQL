with cte as
(
    select event_date,player_id,
    lead(event_date) over(partition by player_id order by event_date) as next_date,
    min(event_date) over(partition by player_id order by event_date) as install_date
    from Activity
    group by event_date,player_id

)

select install_date as install_dt, count(distinct player_id) as installs,
round(sum(case when datediff(next_date,install_date) = 1 then 1 else 0 end)/ count(distinct player_id),2) as Day1_retention
from cte
group by install_date