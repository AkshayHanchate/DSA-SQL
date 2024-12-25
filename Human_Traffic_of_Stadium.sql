-- Write your MySQL query statement below
with cte as
(
    select id, visit_date , people, id - rn as island from (
    select id , visit_date, people,
    rank() over (order by id ) as rn
    from Stadium
    where people >= 100) as t
)

select id, visit_date, people
from cte
where island in (
    select island from cte
    group by island
    having count(1) >= 3)
