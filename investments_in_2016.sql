# Write your MySQL query statement below
with cte as (
    select tiv_2015 from 
    Insurance 
    group by tiv_2015
    having count(*) > 1
),
unique_iden as (
    select pid, tiv_2016
    from Insurance 
    where (lat, lon) in (
        select lat, lon from 
        Insurance 
        group by lat, lon
        having count(*) = 1
    )
)

SELECT 
    ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM 
    Insurance i
JOIN 
    cte t ON i.tiv_2015 = t.tiv_2015
JOIN 
    unique_iden u ON i.pid = u.pid;
