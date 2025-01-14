SELECT business_id
FROM
(SELECT *,
AVG(occurrences) OVER(partition by event_type) as avgo
FROM Events) x
WHERE occurrences > avgo
GROUP BY business_id
HAVING COUNT(business_id) > 1