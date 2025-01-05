--Write your MySQL query statement below
with cte as (
select *,
lag(amount) over (partition by customer_id order by transaction_date) as prev_amt,
lag(transaction_date) over (partition by customer_id order by transaction_date) as prev_day
from Transactions
),

cte2 as (
select *,
TO_DAYS(transaction_date) - RANK() OVER(PARTITION BY customer_id ORDER BY transaction_date) AS GRP
from cte
where amount > prev_amt and datediff(transaction_date,prev_day) = 1
)

select customer_id,
MIN(prev_day) AS consecutive_start,
MAX(transaction_date) AS consecutive_end
from cte2
group by customer_id, grp
having count(grp) >= 2


