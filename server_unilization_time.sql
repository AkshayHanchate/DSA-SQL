# Write your MySQL query statement below
with st as (select
server_id,
status_time,        
session_status,
row_number() over (partition by server_id order by status_time)  st_rn
from servers where session_status='start'),
end as (select
server_id,
status_time,        
session_status,
row_number() over (partition by server_id order by status_time)  end_rn
from servers where session_status='stop')

select floor(sum(timestampdiff(second,st.status_time,end.status_time))/(24 * 60 * 60)) total_uptime_days 
from st left join end on st.server_id=end.server_id and st_rn=end_rn
