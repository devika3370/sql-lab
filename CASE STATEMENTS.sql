# CASE STATEMENTS
# like if else statements

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics;

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'
    WHEN age >= 50 THEN "very old"
END AS age_bracket
FROM employee_demographics;

# Example 
-- Pay increase and bonus 
-- if < 50k = 5% bonus
-- if > 50k = 7% bonus 
-- if in Finance = 10% bonus 

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 1.10
END AS bonus
FROM employee_salary;







