-- Write your MySQL query statement below
with cte as
(
    select num, frequency,
    sum(frequency) over(order by num) freq,
    sum(frequency) over()/2 as medium_n
    from Numbers
)
select avg(num) as median
from cte
where medium_n between (freq - frequency) and freq