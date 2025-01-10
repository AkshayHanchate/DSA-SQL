# Write your MySQL query statement below
select d.name as department, e.name as employee, e.salary as Salary
from Employee e
join Department d
on e.Departmentid = d.id
where 3 > (select count(distinct e2.salary)
from Employee e2 where
e2.salary > e.salary and e.DepartmentId = e2.DepartmentId)