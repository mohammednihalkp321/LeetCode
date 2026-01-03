WITH emp_cte AS (
    SELECT 
        employee_id,
        department_id,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY (primary_flag = 'Y') DESC
        ) AS rk
    FROM Employee
)
SELECT employee_id, department_id
FROM emp_cte
WHERE rk = 1;

