with cte as
(
    select p.player_id, p.group_id,
    sum(case when p.player_id = m.first_player then m.first_score else m.second_score end) as total_score
    from Players p
    join Matches m
    on p.player_id = m.first_player
    or p.player_id = m.second_player
    group by 1,2
), cte1 as (
select *,
dense_rank() over (partition by group_id order by total_score desc,player_id asc) as rn
from cte
)

select group_id , player_id from cte1
where rn = 1