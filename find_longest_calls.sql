# Write your MySQL query statement below

with cte as (
    select c.first_name,c1.type, date_format(sec_to_time(c1.duration),'%H:%i:%s') as duration_formatted
    from Contacts c join Calls c1
    on c.id = c1.contact_id
),rnk as (
select *, row_number() over (partition by type order by duration_formatted desc) as rnk
from cte
)

select first_name, type, duration_formatted
from rnk
where rnk <=3
order by type desc ,duration_formatted desc ,first_name  desc




