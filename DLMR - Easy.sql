# create two columns laptop_views and mobile_views and rows = count of each
# if device is laptop then ++
# else mobile ++
SELECT
  SUM(CASE 
        WHEN device_type = 'laptop' THEN 1 
        ELSE 0 
      END) AS laptop_views,
  SUM(CASE 
        WHEN device_type IN ('tablet', 'phone') THEN 1 
        ELSE 0 
      END) AS mobile_views
FROM viewership;

-- Table consists of user who posted at least twice in 2021
-- Query to find number of days between each user's first and last post 
-- Output - user, no.of days

SELECT 
  user_id, 
  EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) AS "days_between" 
FROM posts
GROUP BY user_id
HAVING MIN(post_date) > '01/01/2021 00:00:00' 
  AND MAX(post_date) < '01/01/2022 00:00:00'
  AND EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) > 0;