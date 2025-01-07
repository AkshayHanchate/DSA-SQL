# Write your MySQL query statement below
select s.product_id, sum(quantity) as total_quantity
from Sales s
join Product p
on s.product_id = p.product_id
group by 1