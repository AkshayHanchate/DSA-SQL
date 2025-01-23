# Write your MySQL query statement below
with cte as (
select * , (seat_id - row_number() over (order by seat_id)) as test
from Cinema
where free = 1
), cte1 as (
    select min(seat_id) as first_seat_id,
    max(seat_id) as last_seat_id,
    count(test) as consecutive_seats_len,
    rank() over(order by count(*)  desc) as rnk
    from cte
    group by test
)

select first_seat_id,last_seat_id,consecutive_seats_len 
from cte1
where rnk = 1
order by 1 
