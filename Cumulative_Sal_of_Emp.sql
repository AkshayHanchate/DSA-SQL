-- Write your MySQL query statement below

select id, month,
       sum(salary) over(partition by id order by month desc range between current row and 2 following) as Salary
from (
    select id, month, salary,
        row_number() over(partition by id order by month desc) as rn
    from employee
) dt
where rn != 1
order by id, month desc