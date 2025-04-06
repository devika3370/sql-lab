# SUBQUERIES
# query within another query 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

# subquery in the WHERE clause
# select employees who work in the parks and recreation department
SELECT employee_id
FROM employee_salary
WHERE dept_id = 1;

# select employee id from employee salary where dept id = 1
# we can use this as a subquery
SELECT employee_id
	FROM employee_salary
	WHERE dept_id = 1;

# final query
# note that we don't see number 2 since it is not present in the employee demographics table
SELECT * 
FROM employee_demographics
WHERE employee_id IN 
	(SELECT employee_id
	FROM employee_salary
	WHERE dept_id = 1)
;

# subquery in SELECT STATEMTENT
# we want to add a column with average salary for the entire group 

# this will give an error saying select list is not in group by clause
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY salary;

# this gives us the avg salary of the group so let's use this as a subquery
SELECT AVG(salary)
FROM employee_salary;

# final query
SELECT first_name, salary,
	(SELECT AVG(salary) FROM employee_salary)
FROM employee_salary;

# subquery in FROM 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

# let's say I want the average of count 
SELECT AVG(`COUNT(age)`)
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table;
