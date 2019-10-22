SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at
BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

/*
Write a query that returns all the orders where the standard_qty is
over 1000, the poster_qty is 0, and the gloss_qty is 0.
*/
Select
*From modeanalytics.parch_and_posey_orders
Where standard_qty > 1000 and poster_qty = 0
and gloss_qty = 0
order by occurred_at desc;

/*
Using the accounts table, find all the companies
whose names do not start with 'C' and end with 's'.
*/
Select
* From modeanalytics.parch_and_posey_account
where name  Not like 'C%' and name like '%s';

/*
Use the web_events table to find all information regarding individuals who
were contacted via the organic or adwords channels, and started their account
at any point in 2016, sorted from newest to oldest.
*/
SELECT *
FROM modeanalytics.parch_and_posey_web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01'
AND '2017-01-01'
ORDER BY occurred_at DESC;
