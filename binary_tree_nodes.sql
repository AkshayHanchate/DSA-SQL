# Write your MySQL query statement below


select N,
case when P is null then 'Root'
when N in (select P from Tree) then 'Inner'
else 'Leaf' end as Type
from Tree
order by N asc
