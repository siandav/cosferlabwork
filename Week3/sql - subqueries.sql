## SUBQUERIES
# compare the loan amount against the average loan amount
# inner query:
SELECT * FROM loan
 where amount > (SELECT avg(amount) FROM loan);
 
 # whitch loan status has a mean loan amount bigger than the overall mean
 SELECT status, avg(amount) as avg_loan FROM loan
 GROUP BY status
 HAVING avg_loan> (SELECT avg(amount) FROM loan);
 
# ACTIVITY 3.04 - ACTIVITY 1. Find out the average of the number of transactions by account. 
SELECT ceil(avg(number_of_transaction)) as Average FROM
#Hint: Compute first the number of transactions by account.
(SELECT account_id, count(trans_id) as number_of_transaction FROM trans
GROUP BY account_id) as sub;
 
 # 1) First i need to find out how many trans per account - group by - account
 # 2) Find the average of those
 
 SELECT ceil(avg(Transaction)) as Average FROM
 (SELECT account_id, count(*) as Transaction from bank.trans
 GROUP BY account_id) as s;
 -----------------------------------------------------------------------------
# example of nested - 3+ levels
SELECT account_id, frequency FROM account
JOIN (SELECT account_id, count(trans_id) as number_of_transaction FROM trans
GROUP BY account_id) as sub2
USING(account_id) 
WHERE
sub2.number_of_transaction>(
SELECT ceil(avg(number_of_transaction)) as Average FROM
(SELECT account_id, count(trans_id) as number_of_transaction FROM trans
GROUP BY account_id) as sub);

# all account, with status that has higher than average amount
SELECT account_id FROM account
JOIN loan USING(account_id)
WHERE status in ('C','D');

# 1. get average loan amount by status
# 2. filter to statuses with higher avg
# 3. get the loans in those status
# 4. Get Loan in those status
SELECT * FROM loan
 WHERE status IN
(SELECT status 
FROM
(SELECT status, avg(amount) as avgloans
FROM loan
GROUP BY status
HAVING avgloans>
(SELECT avg(amount) FROM loan)
) AS s);
