with cte as (
select project_id , count(employee_id) as cnt
from Project
group by 1
)

select project_id
from Project
group by 1
having count(employee_id) = (select max(cnt) from cte)