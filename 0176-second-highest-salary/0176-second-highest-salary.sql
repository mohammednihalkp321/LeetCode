select(
    select distinct salary
    from employee
    order by salary desc
    offset 1 limit 1
)as SecondHighestSalary;
