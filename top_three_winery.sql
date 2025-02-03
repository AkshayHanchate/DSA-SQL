# Write your MySQL query statement below

with cte as (
select 
country,winery, sum(points) as total
from Wineries
group by country , winery
), cte2 as (
select *,  CONCAT(winery, ' (', CAST(total AS CHAR), ')') AS contact_col,
rank() over(partition by country order by total desc, winery asc) as rn
from cte
)


SELECT country,
max(case when rn = 1 then contact_col end) as top_winery,
coalesce(max(case when rn = 2 then contact_col else null end),"No second winery") as second_winery,
coalesce(max(case when rn = 3 then contact_col else null end), "No third winery")  as third_winery
from cte2
group by country
