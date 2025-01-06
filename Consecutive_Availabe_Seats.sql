with cte as
(
    select seat_id, free ,
    lag(seat_id) over (order by seat_id) as prev_seat,
    lead(seat_id) over (order by seat_id) as next_seat
    from Cinema
    where free = 1
)

select seat_id
from cte
where prev_seat + 1 = seat_id or next_seat - 1 = seat_id

