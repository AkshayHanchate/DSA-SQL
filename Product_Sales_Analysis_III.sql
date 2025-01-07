with cte as (
select product_id , year as first_year, quantity, price ,
rank() over (partition by product_id order by year) as rn
from Sales
)

select
product_id ,  first_year, quantity, price
from cte where rn = 1