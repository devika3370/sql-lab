-- Get the third transaction of every user
-- user id, spend, transaction date
SELECT user_id, spend, transaction_date
FROM
  (SELECT 
    user_id, 
    spend, 
    transaction_date, 
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS txn_rank
  FROM transactions
  ) AS ranked_table
WHERE txn_rank = 3
;


-- find second highest salary among all employees
SELECT salary AS second_highest_salary
FROM 
(
  SELECT 
    employee_id, 
    name, 
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) as salary_rank
  FROM employee) AS ranked_table
WHERE salary_rank = 2
;


-- user's ages, time spent sending and opening snaps 
-- total_time = time_sent + time_open
-- time_sent / total_time * 100.0
-- time_open / total_time * 100.0
-- grouped by age
-- round to two decimal places
-- age_bucket, send_perc, open_perc
SELECT age_bucket,
  ROUND(
    SUM(
      CASE 
        WHEN activity_type = 'send' THEN time_spent 
        ELSE 0 
      END) * 100.0 / SUM(time_spent), 2) AS send_perc,
  ROUND(
    SUM(
      CASE 
        WHEN activity_type = 'open' THEN time_spent 
        ELSE 0 
      END) * 100.0 / SUM(time_spent), 2) AS open_perc 
FROM activities AS a
JOIN age_breakdown AS abr ON a.user_id = abr.user_id
WHERE activity_type IN ('send', 'open')
GROUP BY abr.age_bucket;

-- calculate three day rolling average of tweet count
-- output user id, tweet date, rolling avg upto 2 decimals 
SELECT user_id, tweet_date,
  ROUND(AVG(tweet_count) OVER (
  PARTITION BY user_id
  ORDER BY tweet_date
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_avg_3d
FROM tweets;


-- identify top two highest grossing products 
-- within each category
-- in year 2022
-- output - category, product, total spend 
SELECT category, product, total_spend
FROM (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
  FROM product_spend
  WHERE 
    transaction_date >= '01/01/2022 00:00:00' 
    AND transaction_date <= '12/31/2022 00:00:00'
  GROUP BY category, product) AS ranked_table
WHERE ranked_table.rank <= 2
ORDER BY category, total_spend DESC
;
