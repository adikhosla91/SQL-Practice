elect id,
	   account_id,
       standard_amt_usd/standard_qty as std_paper,
from orders
limit 10
/*
Create a column that divides the standard_amt_usd by
the standard_qty to find the unit price for standard paper for each order. Limit the
results to the first 10 orders, and include the id and account_id fields.
*/
SELECT id, account_id, (standard_amt_usd/standard_qty) as unit_price
FROM orders
LIMIT 10;
/*
Write a query that finds the percentage of revenue that comes from poster
paper for each order. You will need to use only the columns that end with _usd.
(Try to do this without using the total column.)
Display the id and account_id fields also.
NOTE - you will receive an error with the correct solution to this question. T
his occurs because at least one of the values in the data creates a division by
zero in your formula. You will learn later in the course how to fully handle this
issue.
For now, you can just limit your calculations to the first 10 orders, as
we did in question #1, and you'll avoid that set of data that causes the problem.
*/
SELECT id,account_id,
       (poster_amt_usd/total_amt_usd)*100 as post_perct_rev
FROM orders
LIMIT 10;

/*  or */
SELECT id, account_id,
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;
