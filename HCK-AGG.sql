# User missing 0 button on keyboard 
# Find error in average miscalculation
SELECT 
    CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM Employees;


# total earnings = salary * months
# return max total earnings, number of employees with those total earnings
# SELECT MAX(salary * months) FROM Employee will give the max total earnings
# select all from employee where salary * months is this amount 
# reduce the selection to the actual amount, and the count of the number of people earning this amount
SELECT 
    MAX(salary * months) AS max_earnings,
    COUNT(*) AS employee_count
FROM Employee
WHERE salary * months = (
    SELECT MAX(salary * months) FROM Employee
);


# rounding up to two decimal places
SELECT 
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM STATION;

# select long_w for the largest lat_n that is less than 137.2345 and round up to 4 decimals 
SELECT ROUND(LONG_W, 4)
FROM STATION 
WHERE LAT_N = (
    SELECT MAX(LAT_N) 
    FROM STATION 
    WHERE LAT_N < 137.2345
);

# manhattan distance between two points 
SELECT
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM STATION;


# calculating median 
# inner most - select latn, give all rows numbers, get total rows 
# outer - select lat n from this, and get the middle row/rows
# take average and round it 
SELECT ROUND(AVG(mid_values),4) AS median_val
FROM (
    SELECT LAT_N AS mid_values
    FROM (
        SELECT 
            LAT_N,
            ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
            COUNT(*) OVER () AS total_rows
        FROM STATION
    ) AS ordered
WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))
) AS median_rows;
