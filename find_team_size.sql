with cte as 
(
    select team_id, count(employee_id) as cnt
    from Employee
    group by team_id
)

select e.employee_id , c.cnt as team_size
from employee e 
join cte c
on e.team_id = c.team_id



second method using partition by 


# Write your MySQL query statement below
SELECT
    employee_id,
    COUNT(team_id) OVER( PARTITION BY team_id) AS team_size
FROM
    Employee;
