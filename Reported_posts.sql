# Write your MySQL query statement below

select extra as report_reason,
count(distinct post_id) as report_count
from Actions
where action = "report"
and action_date = DATE('2019-07-05') - INTERVAL 1 DAY
group by extra

