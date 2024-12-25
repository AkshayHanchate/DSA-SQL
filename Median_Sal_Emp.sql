
select id , company, salary
from
(
select id, company, salary,
row_number() over(partition by company order by salary) as salary_rank,
count(salary) over(partition by company) as cnt_sal
from Employee ) ranking
where salary_rank >= cnt_sal/2 and salary_rank <= cnt_sal/2 + 1