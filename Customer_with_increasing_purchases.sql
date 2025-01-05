with cte as
(
    select customer_id , year(order_date) as year, sum(price) as total,
    lag(year(order_date)) over (partition by customer_id order by year(order_date)) as last_year,
    rank() over (partition by customer_id order by year(order_date)) as rank_year,
    rank() over(partition by customer_id order by sum(price)) as rank_price
    from Orders
    group by 1,2
)


select distinct customer_id
from cte
where customer_id not in (select customer_id from cte where (year-last_year) != 1 or rank_year != rank_price)