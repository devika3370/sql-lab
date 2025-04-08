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