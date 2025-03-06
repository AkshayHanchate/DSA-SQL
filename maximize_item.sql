with cte_prime as 
(
    select 'prime_eligible' as item_type,
    count(item_type) as cnt,
    sum(square_footage) as total_area
    from Inventory
    where item_type = 'prime_eligible'
),cte_nonprime
as 
(
    select 'not_prime' as item_type,
    count(item_type) as cnt,
    sum(square_footage) as total_area
    from Inventory
    where item_type = 'not_prime'
)

SELECT item_type,
       Floor(500000 / total_area) * cnt item_count
FROM cte_prime
UNION
SELECT item_type,
       floor((500000 - (SELECT floor(500000 / total_area) * total_area FROM cte_prime)) / total_area) * cnt item_count
FROM cte_nonprime
ORDER BY item_count DESC


