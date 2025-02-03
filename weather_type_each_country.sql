with cte as 
(
    select c.country_name , avg(w.weather_state) as average
    from Countries c join Weather w 
    on c.country_id = w.country_id
    where month(w.day) = 11 and year(w.day) = 2019
    group by c.country_name
)

select 
country_name,
case when average <= 15 then "Cold"
when average >= 25 then "Hot"
else "Warm" end as weather_type
from cte 



