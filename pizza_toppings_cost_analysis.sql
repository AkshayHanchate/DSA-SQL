# Write your MySQL query statement below

select 
concat(l.topping_name,',',m.topping_name,',',r.topping_name) as pizza,
round(l.cost+m.cost+r.cost,2) as total_cost
from toppings l, toppings m, toppings r
where l.topping_name < m.topping_name and m.topping_name < r.topping_name
order by 2 desc, 1
