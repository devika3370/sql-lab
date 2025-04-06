-- Window function 
# does not roll everything up like group by 

# compare gender with salaries
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

# group by 
SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

# window function 
# average salary over everything 
SELECT gender, AVG(salary) OVER()
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;

# average salary per gender
SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;
    
# if I want to add more columns, without grouping on those columns I can do this 
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;
    
    
# if I add columns to group by it is going to change the avg salary value 
SELECT dem.first_name, dem.last_name, gender, AVG(salary) as avg_salary
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

# sum of salary 
# all men make this much total and all females make this much total 
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;

# rolling total 
# partitions based on gender
# cumulative sums based on employee id 
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total 
FROM employee_demographics as dem 
LEFT JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;
    
    
# row number
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics as dem
JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics as dem
JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;

# rank
# when it encounters a duplicate based on the order by it will assign it the same number 
# the next number is assigned positionally not numerically 
#1	2	3	4	5	5	7
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics as dem
JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;

# dense rank 
# when it encounters a duplicate based on the order by it will assign it the same number 
# the next number is assigned numerically not positionally
#1	2	3	4	5	5	6 
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_num
FROM employee_demographics as dem
JOIN employee_salary as sal 
	ON dem.employee_id = sal.employee_id;