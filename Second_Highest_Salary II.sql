# Write your MySQL query statement below
with cte as (
select
emp_id , salary , dense_rank() over (partition by dept order by salary desc) as rn ,
dept
from employees
)

select emp_id,
dept
from cte
where rn = 2
order by 1
