# common table expression 
# define a subquery block that you can refer to in the script 
# we can name the subquery block
# kinda like functions 
# you can only use the cte immediately after you create it 

WITH cte_example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM cte_example
;

# this will give an error 
# it will say table does not exist 
# with cte it's just a way of expressing the same thing that subquery does 
# it's not actually creating any table 
SELECT AVG(avg_sal)
FROM cte_example;


# we can create multiple CTEs
WITH cte_example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics AS dem
WHERE birth_date > '1985-01-01'
),
cte_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM cte_example
JOIN cte_example2
	ON cte_example.employee_id = cte_example2.employee_id
;