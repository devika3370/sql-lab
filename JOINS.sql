-- JOINS 
# Combine two tables together if they have a common column 
# Common column does not have to have the same name - just some data that we can combine on 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

# INNER JOIN 
# Join salary table to demographics table on the employee id 
# Inner join will only return rows that have the matching value in the column 
SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

# using aliasing 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# selected columns 
# should give error since it does not know which employee id to take
SELECT employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# OUTER JOIN 
# Left outer join - take everything from the left table even if there is no match on the join
# and only return the matches from the right table
# left table = employee_demographics
# right table = employee salary 
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# Right outer join 
# take everything from employee salary and what is not present in left table is null 
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# SELF JOIN 
# tie the table to itself 
# need aliasing to differentiate between the two tables 
# example - secret santa
SELECT *
FROM employee_salary AS emp1 
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1  = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa, 
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name, 
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1 
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1  = emp2.employee_id
;

# Joining multiple tables together 
# one to another to another 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd 
	ON sal.dept_id = pd.department_id
;