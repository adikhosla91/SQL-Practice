/*
Find list of orders ids where either gloss_qty or poster_qty is greater than 4000.
Only include the id field in the resulting table.

Write a query that returns a list of orders where the standard_qty is zero and
either the gloss_qty or poster_qty is over 1000.


Find all the company names that start with a 'C' or 'W', and the
primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
*/

Select account_id from modeanalytics.parch_and_posey_orders
where poster_qty = 0 or gloss_qty =0;

Select * from modeanalytics.parch_and_posey_orders
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000)
order by poster_qty;

Select * from modeanalytics.parch_and_posey_account
where (name like 'C%' or name like 'W%') and (primary_poc like '%ana%'
or primary_poc like '%Ana%') and primary_poc not like '%eana%'
