-- STRING FUNCTIONS

# returns the length of skyfall string 
SELECT LENGTH('skyfall');

# length of the first name 
SELECT first_name, length(first_name) as name_len
FROM employee_demographics
ORDER BY name_len
;

# UPPER
SELECT UPPER('sky');

# LOWER
SELECT LOWER('sKy');

# making their names all caps 
SELECT first_name, UPPER(first_name) as caps_name
FROM employee_demographics
;

# TRIM 
# trim - just trims white space at the front or at the end 
SELECT '       sky  ';
SELECT TRIM('       sky  ');
# ltrim - just get rid of the left side 
# rtrim - just the right side
SELECT LTRIM('       sky  ');
SELECT RTRIM('       sky  ');


# select four characters from the left for the first name column 
SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;
# same for right - rightmost 4 characters
SELECT first_name, RIGHT(first_name, 4)
FROM employee_demographics;

# SUBSTRINGS 
# go to the third position and then go to the right 2 characters (INCLUDING THE THIRD)
# extracting month from the birth date
SELECT first_name, 
SUBSTRING(first_name, 3, 2),
SUBSTRING(birth_date, 6, 2)
FROM employee_demographics;

# REPLACE 
# replace specific characters with a different character that you want
# (column, what we want to replace, what we want to replace it with)
SELECT first_name, REPLACE(first_name, 'a', 'az')
FROM employee_demographics;


# LOCATE
# what you are looking for, what you are looking in 
# returns the position
SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('an', first_name)
FROM employee_demographics;


# CONCAT
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) as full_name
FROM employee_demographics;

