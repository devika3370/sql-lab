-- Limit and aliasing 

SELECT * 
FROM employee_demographics
LIMIT 3
;

# oldest three people 
SELECT * 
FROM employee_demographics
ORDER BY age DESC 
LIMIT 3
;

# start at position 2 and then go one row after it 
SELECT * 
FROM employee_demographics
ORDER BY age DESC 
LIMIT 2, 1
;

-- Aliasing 
# basically just changing column name 

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40 
;




