SELECT * FROM bank.trans;
USE sakila; # change the main data (we are suppose to use bank)
USE bank; # changing back

SELECT date, type, account_id FROM trans # select specif columns from a table
WHERE type='PRIJEM'; # going to filter

SELECT COUNT(*) FROM trans WHERE type='PRIJEM';

SELECT * FROM trans LIMIT 10; # limit the amount of rows you are going to see
# then you need to take the limit away 

SELECT DISTINCT operation FROM trans LIMIT 10;
SELECT COUNT(DISTINCT type) FROM trans LIMIT 10;

# ALIASING (AS): change columns, or tables name
SELECT a2 AS district_name, a3 AS region_name FROM district AS hello LIMIT 30;

## applying aliasing:
SELECT t.trans_id AS Transaction_id,
t.account_id AS Account_id,
t.date AS Dateoftrans,
t.type AS Trans_Type
FROM trans as t;
## It's good to use alias for table when you are goins to use date, type ## normally they are functions so you describe from where you are taking them look above that you can see it;

# create field 0 using queries - SELECT operator FROM
SELECT *, round((amount-payments)/1000,2) as balance_k FROM loan
WHERE status!='B'; ## not equal to, or you can use '<>'
# WHERE status IN('B','D'), NOT IN(), !=, <>, <,>, 
# '*', '-', '/', '+'

################################ CHECK WITH OTHERSSSSSSSS ###################

# not and not - order table, return all records not SIPO AMOUNT not UNDER 1000
# Agreggations: max, min, floor, ceiling, round, log, sqrt	

SELECT MAX(amount), MIN(amount), FLOOR(AVG(amount)) from bank.order;

# string functions: concat, strip, left, right, upper, lower, rtrim, ltrim
# like, replace, length

# order id + acc concat
SELECT *, CONCAT(order_id, account_id) as reference
FROM bank.order;

SELECT MAX(length(a2)) from district;

SELECT * from district where length(a2)=19;

SELECT *, concat(left(a2,4), right(a3,4)) as new_column from district where length(a2)=19;

## ACTIVITY 3.3
# 1. get all junior cards issued later than the last year
# hint: use numeric value (980000)
SELECT * from card where type='junior' and issued>980000;
# 2.
SELECT * FROM trans where operation='VYBER' limit 10;
# 3.
SELECT loan_id, account_id, amount, amount-payments as debt
FROM bank.loan WHERE status='B' AND amount-payments>1000 ;
# 4.
SELECT MAX(amount), MIN(amount) from trans WHERE amount!=0;
# 5.
SELECT *, CASE when left(date,2)<39 THEN CONCAT('20',LEFT(date,2))
else
concat('19',left(date,2))
end as year_open
 from account;
 
# CONVERT type of the column to date - it's going only to change inside the query
# DATE_FORMAT()

SELECT *, CONVERT(a.date,DATE) as full_date FROM account as a;
SELECT *, LEFT(CONVERT(a.date,DATE),4) as year FROM account as a; ## going to take the 4 digits of the full date
SELECT *, DATE_FORMAT(CONVERT(a.date,DATE),'%d/%m/%Y') as open_date FROM account as a;

## split the columns check issued before and after the SUBSTRING_INDEX
SELECT CONVERT(SUBSTRING_INDEX(issued,' ',1),DATE) AS issuedate FROM card;
SELECT issued from card;

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