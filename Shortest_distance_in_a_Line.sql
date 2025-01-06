# Write your MySQL query statement below
with cte as
(select p.x , p1.x as x2,
abs(p.x - p1.x) as diff
from Point p
join point p1
on p.x != p1.x)


select min(diff) as shortest from cte