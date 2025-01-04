CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    SET group_concat_max_len = 1000000;
    SET @sql = NULL;
    Select
    GROUP_CONCAT(distinct concat('sum(if(store = "',store,'",price,null)) AS ',store)order by store asc)
    into @sql
    from Products;

    SET @sql = CONCAT('select product_id, ',@sql, ' from products group by product_id ');


    PREPARE stmt from @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END