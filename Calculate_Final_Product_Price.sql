# Write your MySQL query statement below


select p.product_id ,
IFNULL(p.price * (1-discount/100), p.price) AS final_price,
p.category
from Products p
left join Discounts d
on p.category = d.category

