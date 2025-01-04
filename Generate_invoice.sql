# Write your MySQL query statement below
with cte as (
select  p1.invoice_id, p.product_id ,(price * quantity) as price, sum(price * quantity) over(partition by invoice_id) as total, quantity
from Products p
join Purchases p1
on p.product_id = p1.product_id
),cte2 as (

select product_id, quantity,price,
 rank() over (order by total desc, invoice_id asc) as rn
from cte
)

select product_id,quantity, price from cte2
where rn = 1
