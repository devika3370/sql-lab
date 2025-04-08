# Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
# and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT CNT.CONTINENT, FLOOR(AVG(CTY.POPULATION))
FROM COUNTRY AS CNT 
JOIN CITY AS CTY 
    ON CNT.CODE = CTY.COUNTRYCODE
GROUP BY CNT.CONTINENT;


# NAME, GRADE, MARK 
# NO NAME BELOW 8
# DESCENDING ORDER
# IF SAME GRADE GREATER THAN 8 - SORT ALPHABETICALLY
# IF GRADE LOWER THAN 8 - NULL NAME, SAME GRADE- ORDER BY MARKS IN ASCENDING ORDER

SELECT 
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE 'NULL'
    END AS Name,
    G.Grade, 
    S.Marks
FROM Students AS S
JOIN Grades AS G
    ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC,
    CASE 
        WHEN G.Grade >= 8 THEN S.Name 
        ELSE 'NULL'
    END ASC,
    CASE 
        WHEN G.Grade < 8 THEN S.Marks 
        ELSE 'NULL' 
    END ASC;
    
    
    
*/

# Print hacker_id, name of hacker who got full score for more than one challenge
# order in desc order total no of challenges where full score
# if more than one - sort asc by hacker_id

# Hackers = hacker_id, name
# Difficulty = difficulty_level, score
# Challenges = challenge_id, hacker_id (who created the challenge), difficulty_level
# Submissions = submission_id, hacker_id (who made the submission), challenge_id, score

# condition: Submission.score = Difficulty.score

SELECT H.hacker_id, H.name
FROM Hackers H
JOIN(
    SELECT S.hacker_id, COUNT(DISTINCT S.challenge_id) as num_challenges
    FROM Submissions AS S
    JOIN Challenges AS C ON S.challenge_id = C.challenge_id
    JOIN Difficulty AS D ON D.difficulty_level = C.difficulty_level
    WHERE S.score = D.score
    GROUP BY S.hacker_id
    HAVING num_challenges > 1
) AS full_score ON H.hacker_id = full_score.hacker_id
ORDER BY full_score.num_challenges DESC, H.hacker_id ASC

# min no. of galleons needed to buy each non-evil wand of high power and age
# print id, age, coins needed, power
# order by desc power
# if more than one wand has same power - sort in desc age

# Wands: id, code, coins_needed, power
# Wands Property: code, age, is_evil (0 means non-evil)

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
JOIN (
    SELECT wp.age, w.power, MIN(w.coins_needed) AS min_coins
    FROM Wands w
    JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.age, w.power
) AS cheapest ON wp.age = cheapest.age 
              AND w.power = cheapest.power 
              AND w.coins_needed = cheapest.min_coins
WHERE wp.is_evil = 0
ORDER BY w.power DESC, wp.age DESC;



/*
Enter your query here.
*/
# print hacker_id, name, total challenges created by each student 
# sort desc total number of challenges
# sort by hacker id asc
# exclusion criteria - if same no of challenges but not max - exclude

# Hackers - hacker_id, name 
# Challenges - challenge_id, hacker_id (who created the challenge)

-- Step 1: Count how many challenges each hacker created
WITH HackerChallengeCounts AS (
    SELECT 
        c.hacker_id, 
        h.name, 
        COUNT(*) AS challenge_count
    FROM Challenges c
    JOIN Hackers h ON c.hacker_id = h.hacker_id
    GROUP BY c.hacker_id, h.name
),
-- Step 2: Find how many hackers have each specific challenge count
CountFrequency AS (
    SELECT 
        challenge_count, 
        COUNT(*) AS number_of_hackers_with_this_count
    FROM HackerChallengeCounts
    GROUP BY challenge_count
)
-- Step 3: Select hackers who either:
--         - Created the maximum number of challenges, OR
--         - Have a unique number of challenges (no other hacker has the same count)
SELECT h.hacker_id, h.name, h.challenge_count
FROM HackerChallengeCounts h
JOIN CountFrequency f ON h.challenge_count = f.challenge_count
WHERE 
    h.challenge_count = (SELECT MAX(challenge_count) FROM HackerChallengeCounts)
    OR f.number_of_hackers_with_this_count = 1
ORDER BY h.challenge_count DESC, h.hacker_id;


