
with cte as 
(
select distinct student_id , subject,
first_value(score) over(partition by student_id,subject order by exam_date) as first_score,
first_value(score) over(partition by student_id,subject order by exam_date desc) as latest_score
from Scores
)

select  * from cte
where first_score<latest_score
