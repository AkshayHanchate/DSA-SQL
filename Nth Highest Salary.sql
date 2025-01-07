CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
select salary from
  (
    select salary, dense_rank() over (order by salary desc) as ranking
    from employee
  ) as ranked_salary
  where ranking = N
  LIMIT 1
  );
END;

