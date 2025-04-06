-- stored procedures
-- save SQL code that can be used over and over again 
-- USE parks_and_recreation
CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >=50000;

CALL large_salaries();

# multiple queries in the stored procedure
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >=50000;
	SELECT *
	FROM employee_salary
	WHERE salary >=10000;
END $$
DELIMITER ;

CALL large_salaries2();

# good practices to create stored procedure
USE `parks_and_recreation`;
DROP procedure IF EXISTS `new_procedure`;
DELIMITER $$
CREATE PROCEDURE `new procedure`()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >=50000;
	SELECT *
	FROM employee_salary
	WHERE salary >=10000;
END $$
DELIMITER ;

# passing parameters
DELIMITER $$
USE `parks_and_recreation`;
DROP procedure IF EXISTS `new_procedure`;
CREATE PROCEDURE `new_procedure`(id INT)
BEGIN
	SELECT salary
	FROM employee_salary as sal
	WHERE sal.employee_id = id;
END $$
DELIMITER ;
CALL `new_procedure`(1);