WITH cte AS (
    SELECT  *,
            PERCENT_RANK() OVER(PARTITION BY state ORDER BY fraud_score DESC) AS pct
    FROM Fraud
)


SELECT  policy_id, 
        state,
        fraud_score
FROM cte 
WHERE pct <= 0.05
ORDER BY state ASC, fraud_score DESC, policy_id ASC
