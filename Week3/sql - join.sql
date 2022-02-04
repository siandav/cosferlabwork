use bank;
# start with a simple join 2 tables
# how many clients per district? Compared to population.

SELECT count(c.client_id) as noofclients, d.a2 as districtname, d.a4 as population,
round(COUNT(c.client_id)/d.a4,4)*100 as proportion
FROM 
	district d
		JOIN client c# inner by default
			 ON d.a1 = c.district_id # saying witch are the values in common between the two tables
GROUP BY a2,a4
ORDER BY proportion DESC;

# loan and account
SELECT account_id, loan_id, duration, amount, frequency FROM loan
JOIN account
USING(account_id) # shorthand when fk field names matches - we are using now, because both table has one column in common
;

# how many loans and the total amount of loans per district
# join loan, account and district

SELECT d.a2 as districtname, 
count(a.account_id) as noofaccounts, 
count(l.loan_id) as noofloans, 
sum(l.amount) as totalloanamount
FROM loan l
JOIN account a
USING(account_id)
JOIN district d
ON d.a1 = district_id
GROUP BY d.a2
;

SELECT * FROM loan
RIGHT JOIN account # prioritises account table
USING(account_id)
WHERE loan_id is null;

---------------------------------
# 1 Get a list of districts ordered by the number of customers (descending order). Name the columns as: District_name and Number_of_customers respectively.
SELECT d.a2 as district_name, count(c.client_id) as number_of_customers from district d
JOIN client c
ON d.a1 = c.district_id
GROUP BY d.a2
ORDER BY number_of_customers DESC;

# 2 Get a list of regions ordered by the number of customers (descending order). Name the columns as: Region_name and Number_of_customers respectively.
SELECT d.a3 as region_name, count(c.client_id) as number_of_customers from district d
JOIN client c
ON d.a1 = c.district_id
GROUP BY d.a3
ORDER BY number_of_customers DESC;

# 3 Get the number of accounts opened by district and year. Name the columns as: District_name, Year and Accounts_opened. Order the results by District_name and Year.
SELECT d.a2 as district_name, count(a.account_id) as account_opened, 
concat('19', left(a.date,2)) as year_opened
FROM account a
JOIN district d
ON a.district_id = d.a1
GROUP BY d.a2, year_opened
ORDER BY d.a2, year_opened;
---------------------------------

# working with a bridge table - applying filter on OWNER
# no of people per loan status
SELECT * FROM client c
JOIN disp d
USING (client_id)
#JOIN account a  # in this case account is not necessary, because loan and disp+client has account_id in common
#USING (account_id)
JOIN loan l
USING (account_id)
WHERE d.type='OWNER';
