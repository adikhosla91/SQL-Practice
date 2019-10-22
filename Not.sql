select * from accounts
where name not in ('%S')

/*
Use the accounts table to find the account name, primary poc,
and sales rep id for all stores except Walmart, Target, and Nordstrom.
*/

SELECT name,primary_poc,sales_rep_id
FROM accounts
WHERE name Not in ('Walmart','Target','Nordstrom');
/*
Use the web_events table to find all information regarding
individuals who were contacted via any method except
using organic or adwords methods.
*/

SELECT * FROM web_events
WHERE channel Not in ('organic','adwords');

/*
Use the accounts table to find:

All the companies whose names do not start with 'C'.

All companies whose names do not contain the string 'one' somewhere in the name.

All companies whose names do not end with 's'.
*/

Select * from accounts
where name not like 'C%';

Select * from accounts
where name not like '%one%';

Select * from accounts
where name not like '%s';
