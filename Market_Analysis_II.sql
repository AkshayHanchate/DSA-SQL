with cte as
(SELECT *
FROM
 (SELECT order_id, order_date, item_id as item_id1, seller_id, rank() over (partition by seller_id order by order_date) rnk FROM Orders o1) sub1
WHERE rnk=2),

cte2 as (SELECT *
        FROM cte
        JOIN Items i
        ON i.item_id=cte.item_id1)



SELECT u.user_id as seller_id,
(CASE
    WHEN u.favorite_brand=cte2.item_brand THEN 'yes'
    ELSE 'no'
END) as 2nd_item_fav_brand
FROM users u
LEFT JOIN cte2
ON u.user_id=cte2.seller_id;