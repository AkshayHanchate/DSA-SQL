# Write your MySQL query statement below
select c.name from Candidate c
join Vote v on c.id = v.candidateId
group by 1
ORDER BY count(v.id) desc
LIMIT 1
