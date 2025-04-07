# Question: Query two cities with the shortest and longest city name and their respective lengths. 
# If two have same length, choose one that comes first when ordered alphabetically 
(
SELECT CITY, LENGTH(CITY) AS len_city
FROM STATION 
ORDER BY len_city ASC, CITY ASC
LIMIT 1
)
UNION
(
SELECT CITY, LENGTH(CITY) AS len_city
FROM STATION 
ORDER BY len_city DESC, CITY ASC
LIMIT 1
);

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
# Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');
