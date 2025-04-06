-- Temporary Tables
# only available in the session
# store intermediate results 

CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);

# it's basically like a real table but only present in memory 
SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Devika', 'Gumaste', '27 dresses');

SELECT *
FROM temp_table;

SELECT*
FROM employee_salary;

# create a temp table with salary > 50k
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >=50000;

SELECT *
FROM salary_over_50k;