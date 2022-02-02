# continuing to query a single table
use bank;
SELECT * FROM trans
ORDER BY amount ASC, date DESC;

# LIKE % REGEX
SELECT * FROM district
WHERE a3 LIKE '%nort%';

# top 10 - ORDER BY + LIMIT
SELECT * FROM district
ORDER BY a4 DESC limit 5;
----------------------------------
## ACTIVITY 3.03 1
# 1
SELECT * FROM trans
WHERE date<='930116';

# 2
SELECT DISTINCT a2 FROM district
WHERE a2 LIKE 'M%';

# 3
SELECT DISTINCT a2 FROM district
WHERE a2 LIKE '%m';
----------------------------------
# Creating a View
CREATE OR REPLACE View loan_statuses as
SELECT loan_id, account_id,
CASE
WHEN status = 'A' then 'good - finished'
WHEN status = 'B' then 'bad - unpaid'
WHEN status = 'C' then 'good - running'
else 'default - running'
END
as status_description
FROM loan
WHERE amount is not null;
 
 
 
 SELECT status_description,
 COUNT(distinct loan_id) AS noofloans,
 COUNT(distinct account_id) AS noofaccounts
 FROM loan_statuses
 GROUP BY status_description;
 
 # GROUP BY
 SELECT type, operation, date, COUNT(*)
 FROM bank.trans
 GROUP BY type, operation, date;
 
 USE bank;
 SELECT * FROM bank.order;
 SELECT bank_to,
 ceiling(AVG(amount)) as avg_amount,
 COUNT(*) AS nooforders,
 ceiling(SUM(amount)) AS total_amount,
 MAX(amount) as biggest
 FROM bank.order
 GROUP BY bank_to
 ORDER BY biggest DESC;
 
----------------------------------------
# ACTIVITY 3.03 2
# 1 Get the total rental revenue using the column amount from table payment. Display it as Total_revenue.
SELECT SUM(amount) as total_revenue FROM sakila.payment;
# 2 Get the total rental revenue by client_id sorted by total benefit in descending order.
SELECT *, sum(amount) as total_revenue
FROM sakila.payment
GROUP BY customer_id HAVING total_revenue>100
ORDER BY total_revenue DESC;
-----------------------------------------

# WINDOW function
# OVER(), PARTITION BY
SELECT customer_id, sum(amount) as total_revenue,
rank() over( ORDER BY SUM(amount) DESC) ranked_sales
FROM sakila.payment
GROUP BY customer_id 	 
total_revenue>100
LIMIT 100;

SELECT loan_id, duration, amount, status,
AVG(amount) over(partition by duration order by status) avg_amnt,
amount-(avg(amount) over(partition by duration)) as diff
FROM loan;

SELECT loan_id, duration, amount, status,
AVG(amount) over(partition by duration,status order by status) avg_amnt,
amount-(avg(amount) over(partition by duration,status)) as diff,
row_number() over(partition by status,duration order by status DESC) as row_no
FROM loan
ORDER BY diff DESC;

SELECT account_id,
convert(t.date,date) as dateoftrans,
amount,
round(sum(amount) over(partition by account_id order by t.date)) as cumulative_balance
FROM bank.trans as t WHERE account_id < 10;

-----------------------------------------
# ACTIVITY 3.03 4 - use sakila database
# 1 Get the mean movie-length by rating in descending order of Mean_length.
SELECT rating, round(avg(length),2) as 'Mean_length' from sakila.film
group by rating
order by Mean_length desc;

# 2 Get the rating, title, length, Mean_rating_length and the film ranking partitioned by rating ordered in descending order of length.
SELECT rating, title, length,
avg(length) over(partition by rating) as 'Mean_rating_length',
dense_rank() over(partition by rating order by length desc) as 'Ranking'
from sakila.film
order by rating, length DESC;

## REGEX for fuzzy matching REGEXP_LIKE | REGEXP
SELECT DISTINCT title FROM sakila.film
# WHERE REGEXP_LIKE(title, '^P'); # in the beginning
# WHERE REGEXP_LIKE(title, 'er$'); # in the end
# WHERE REGEX_LIKE(title, 'phobia'); # somewhere in the middle
# WHERE title REGEXP 'er$'; # also at the end
# WHERE title REGEXP 'hea|per'; # OR clause
# WHERE title REGEXP '[xz]'; # any letter between X and Z
WHERE title REGEXP '[A-C]'; # any letter between X and Z