SELECT d.a2 as district, sum(l.amount) as loans, avg(l.amount) as avgloan FROM bank.loan as l
JOIN account as a
USING(account_id)
JOIN district as d on
a.district_id = d.a1
GROUP BY d.a2;

