# UNIONS
# Union can combine rows 
# Joins combine columns 

# by default union is union distinct 
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

# use case
# parks dept wants to identify older people that they can push out 
# they also want emp who are paid highly 
SELECT first_name, last_name, 'Old Man' AS Label 
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION 
SELECT first_name, last_name, 'Old Lady' AS Label 
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'High Paid' as Label 
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name 
;