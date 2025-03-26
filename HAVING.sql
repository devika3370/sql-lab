-- Having vs Where

# should give error
# aggregate happens after group by operation 
# so here we are trying to filter based on AVG(age) column which has not been created yet 
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;

# this will work 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT *
FROM employee_salary
;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
;

# filtering on aggregated columns after group by? -- USE HAVING 
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;