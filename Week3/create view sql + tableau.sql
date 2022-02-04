create or replace view bad_clients as
SELECT l.status,
date_format(convert(t.date,date), '%M.%Y') as M_Y,
count(distinct account_id) as noofaccount, 
count(distinct d.client_id) as noofclients,
ceiling(sum(t.amount)) as moved_amount,
count(distinct t.trans_id) as nooftrans
FROM trans t
JOIN account a USING (account_id)
JOIN disp d USING (account_id)
JOIN loan l USING (account_id)
WHERE d.type = 'OWNER'
GROUP BY status, date_format(convert(t.date,date),'%M.%Y');
# add loan_status to the group by