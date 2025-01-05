with cte as
(
    select count(distinct concat(requester_id, accepter_id)) as accept_cnt
    from RequestAccepted
), cte2 as
(
    select count(distinct concat(sender_id, send_to_id)) as total_cnt
    from FriendRequest
)

select
ifnull(round(accept_cnt/total_cnt,2),0.00) as accept_rate
from cte join cte2

