-- GROUP BY

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

# should give an error 
# if we are not doing aggregate then the select and group by column must match 
SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

# average age per gender
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

# max age per gender, min age per gender, count = how many ages 
SELECT gender, MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY 

# default is ascending 
SELECT *
FROM employee_demographics
ORDER BY first_name
;

# descending
SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;

# sort by gender and age
# sorts the first column first and then sorts the second column 
# therefore, order of the columns that we put in ORDER BY is very important 
SELECT *
FROM employee_demographics
ORDER BY gender, age
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;

# we can order using column positions instead of names 
# eh I don't like it - what if the column is deleted somewhere - numbers will change
SELECT *
FROM employee_demographics
ORDER BY 5, 4



