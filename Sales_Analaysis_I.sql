# Write your MySQL query statement below
with cte as (
select s.seller_id, sum(p.unit_price * s.quantity)  as price
from Product p
join Sales s
on p.product_id = s.product_id
group by 1
order by price
)


select seller_id
from cte
where price in (select max(price) from cte)

