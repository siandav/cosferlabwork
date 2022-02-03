# 3.05 ACTIVITY 2
# 1. Get a list of accounts from Central Bohemia using a subquery.
SELECT account_id FROM account a
WHERE district_id IN
(SELECT a1 FROM district WHERE a3 ='central Bohemia');

# 2. Rewrite the previous as a join query.
SELECT a.account_id FROM account a
JOIN district d
ON a.district_id = d.a1
WHERE d.a3 ='central Bohemia'
GROUP BY a.account_id
ORDER BY a.account_id ASC;

# 3. Discuss which method will be more efficient.