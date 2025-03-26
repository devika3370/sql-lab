-- SELECT query filters on columns 

SELECT * 
FROM parks_and_recreation.employee_demographics;

# Selecting columns by name 
SELECT first_name, 
last_name, 
birth_date,
age,
# can perform math operations in SELECT
# follows BODMAS 
age + 10,
(age * 10) + 10
FROM parks_and_recreation.employee_demographics;

# selecting unique 
SELECT DISTINCT gender 
FROM parks_and_recreation.employee_demographics;

# this will consider the "pair" as unique
SELECT DISTINCT first_name, gender 
FROM parks_and_recreation.employee_demographics;

