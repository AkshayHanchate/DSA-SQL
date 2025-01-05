with abc as
(
    select managerid from employee group by managerid having count(managerid)>=5)

select name from employee a inner join abc  b
on a.id = b.managerid;