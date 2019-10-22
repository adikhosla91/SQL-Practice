/*
most SQL environments, although not in our Udacity's classroom, you can use
single or double quotation marks - and you may NEED to use double quotation
marks if you have an apostrophe within the text you are attempting to pull.
In our Udacity SQL workspaces, note you can include an apostrophe
by putting two single quotes together. For example, Macy's in
 our workspace would be 'Macy''s'.
*/

Select * from web_events
where channel in ('organic','adwords')

/*
Use the accounts table to find the account name, primary_poc,
and sales_rep_id for Walmart, Target, and Nordstrom
*/

SELECT name,primary_poc,sales_rep_id
FROM accounts
WHERE name in  ('Walmart','Target','Nordstrom');
/*
Use the web_events table to find all information regarding individuals
who were contacted via the channel of organic or adwords.
*/
SELECT * FROM  web_events
where channel in ('organic') or channel in ('adwords');

/* OR
*/
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');
