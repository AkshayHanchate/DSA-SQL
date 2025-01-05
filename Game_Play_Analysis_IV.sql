# Write your MySQL query statement below
with cte as (
select player_id, min(event_date) as first_login_date
from Activity
group by player_id
)


select round(sum(datediff(a.event_date, c.first_login_date) = 1) / count(distinct a.player_id),2)
as fraction
from Activity a
join cte c
on a.player_id = c.player_id




