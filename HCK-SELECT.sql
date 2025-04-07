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


# Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
# If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
# had to use subquery because columns in order by need to be present in select list 
SELECT NAME 
FROM (
    SELECT DISTINCT NAME, ID
    FROM STUDENTS
    WHERE MARKS > 75
    ORDER BY RIGHT(NAME, 3), ID ASC
) AS sub;