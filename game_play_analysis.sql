# Write your MySQL query statement below
select p.player_id, Min(p.event_date) as first_login
from Activity p group by p.player_id