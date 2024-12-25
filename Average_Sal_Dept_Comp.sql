--  Write your MySQL query statement below
with cte as
(
    select date_format(s.pay_date, '%Y-%m') as pay_month ,e.department_id ,avg(s.amount)  as avg_amt
    from Salary s
    join Employee e
    on s.employee_id = e.employee_id
    group by 1,2
),by_company as (
  select
    avg(amount) as company_avg,
    date_format(pay_date, '%Y-%m') as pay_month
  from salary
  group by pay_month
)

select
  pay_month,
  department_id,
  case
    when avg_amt > company_avg then 'higher'
    when avg_amt < company_avg then 'lower'
    else 'same'
  end as comparison
from cte join by_company using(pay_month)
