# User missing 0 button on keyboard 
# Find error in average miscalculation
SELECT 
    CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM Employees