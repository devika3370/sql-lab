-- WHERE Clause filters on rows 

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie'
;

# Arithmetic operators 
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary < 50000
;

SELECT * 
FROM employee_demographics
WHERE gender != 'Female'
;

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

# Logical Operators (AND, OR NOT)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

SELECT *
FROM employee_demographics
WHERE (first_name='Leslie' AND age = 44) OR age > 55
;

# LIKE statement
SELECT *
FROM employee_demographics
WHERE first_name='Jerry'
;

# starts with Jer
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

# has er somewhere in the name 
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'
;

# starts with a 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'
;

# has only two characters after a 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
;

# starts with a has three characters and then anything after that 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'
;

# birthdate starts with 1989
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;
