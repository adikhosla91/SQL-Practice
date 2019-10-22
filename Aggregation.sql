/*
Find the total amount of poster_qty paper ordered in the orders table.
*/
Select SUM(poster_qty)
from modeanalytics.parch_and_posey_orders

/*
Find the total amount of standard_qty paper ordered in the orders table.
*/

Select Sum(standard_qty)
from modeanalytics.parch_and_posey_orders

/*
Find the total dollar amount of sales using
the total_amt_usd in the orders table
*/

Select Sum(total_amt_usd)
from modeanalytics.parch_and_posey_orders

/*
Find the total amount spent on standard_amt_usd and gloss_amt_usd paper
 for each order in the orders table. This should give a
 dollar amount for each order in the table.
 */
 Select sum(standard_amt_usd) as Standard_cost, SUM(gloss_amt_usd),
 col1+col2 as toal_cost from modeanalytics.parch_and_posey_orders

 SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
 FROM modeanalytics.parch_and_posey_orders;

 /*
 Find the standard_amt_usd per unit of standard_qty paper.
 Your solution should use both an aggregation and a mathematical operator.
 */
 Select (sum(standard_amt_usd)/sum(standard_qty)) as average_per_unit_price
 From modeanalytics.parch_and_posey_orders;

 /* Min Max Avg
 When was the earliest order ever placed? You only need to return the date.
 */
Select min(occurred_at)
from modeanalytics.parch_and_posey_orders;
/*
Try performing the same query as in question 1 without
using an aggregation function
*/

Select occurred_at from
modeanalytics.parch_and_posey_orders
order by occurred_at asc
limit 1;

/*
When did the most recent (latest) web_event occur?
*/

Select max(occurred_at)
from modeanalytics.parch_and_posey_web_events

/*
Try to perform the result of the previous
query without using an aggregation function.
*/
Select occurred_at from
modeanalytics.parch_and_posey_orders
order by occurred_at desc
limit 1;

/*
Find the mean (AVERAGE) amount spent per order on
each paper type, as well as the mean amount of each paper type
purchased per order. Your final answer should have 6 values -
one for each paper type for the average number of sales,
as well as the average amounts
 */
Select avg(gloss_qty) as gloss_unit_avg, avg(gloss_amt_usd)
as gloss_sales_usd,avg(standard_qty) as stan_unit_avg,
avg(standard_amt_usd) as stan_sales_usd,
avg(poster_qty) as post_unit_avg,avg(poster_amt_usd) as post_sales_usd
from modeanalytics.parch_and_posey_orders;
/*
Via the video, you might be interested in how to calculate the MEDIAN.
Though this is more advanced than what we have covered so far try finding
- what is the MEDIAN total_usd spent on all orders?
*/
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
/*
Since there are 6912 orders - we want the average of the 3457 and 3456 order
 amounts when ordered. This is the average of 2483.16 and 2482.55.
 This gives the median of 2482.855
 /*
 Which account (by name) placed the earliest order?
 Your solution should have the account name and the date of the order.
 */
Select a.name as account_name, min(o.occurred_at)
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_orders o
on a.id=o.account_id
Group by a.name
limit 1;
/*
Find the total sales in usd for each account. You should include
two columns - the total sales for each company's orders
in usd and the company name
*/
Select a.name as account_name, sum(o.total_amt_usd)
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_orders o
on a.id=o.account_id
Group by a.name;

/*
Via what channel did the most recent (latest) web_event occur,
which account was associated with this web_event? Your query should
return only three values - the date, channel, and account name.
*/
Select a.name as account_name,w.channel,w.occurred_at
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_web_events w
on a.id=w.account_id
Order by w.occurred_at desc
Limit 1;
/*
ind the total number of times each type of channel from
the web_events was used. Your final table should have
 two columns - the channel and the number of times the channel was used.
 */
Select channel,Count(*) as Usgae
from modeanalytics.parch_and_posey_web_events
Group by channel
Order by 2 desc;
/*
Who was the primary contact associated with the earliest web_event?
*/

Select a.primary_poc as primary_contact,w.occurred_at
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_web_events w
on w.account_id = a.id
Order by w.occurred_at asc
limit 1;
/*
What was the smallest order placed by each
 account in terms of total usd. Provide only two columns -
 the account name and the total usd. Order from smallest dollar
  amounts to largest
*/
Select a.name as account_name,sum(o.total_amt_usd) as total_usd
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_orders o
on o.account_id=a.id
Group by 1
order by 2 asc;
/*
Find the number of sales reps in each region. Your final table should
have two columns - the region and the number of sales_reps.
Order from fewest reps to most reps.
*/
Select r.name as region_name, Count(s.id)
from modeanalytics.parch_and_posey_region r
Join
modeanalytics.parch_and_posey_sales_rep s
on r.id = s.region_id
Group by 1
Order by 2 asc;
/*
For each account, determine the average amount of
each type of paper they purchased across their orders.
Your result should have four columns - one for the account
name and one for the average quantity purchased for each of
the paper types for each account
*/
Select a.name account_name, avg(o.standard_qty) as std_paper,
avg(o.poster_qty) as poster_paper, avg(gloss_qty) as gloss_qty
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_orders o
on o.account_id = a.id
Group by(account_name);
/*
For each account,
determine the average amount spent
per order on each paper type.
Your result should have four columns -
one for the account name and one for the average
amount spent on each paper type.
*/
Select a.name account_name, avg(standard_amt_usd) std_usd,
avg(poster_amt_usd) poster_usd, avg(gloss_amt_usd) gloss_usd
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by(account_name)
/*
Determine the number of times a particular channel
was used in the web_events table for each sales rep.
Your final table should have three columns -
the name of the sales rep, the channel, and
the number of occurrences. Order your
table with the highest number of occurrences first.
*/
SELECT s.name, w.channel, COUNT(*) num_events
FROM modeanalytics.parch_and_posey_account a
JOIN modeanalytics.parch_and_posey_web_events w
ON a.id = w.account_id
JOIN modeanalytics.parch_and_posey_sales_rep s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

/*
Determine the number of times a particular channel was used in
 the web_events table for each region. Your final table should
 have three columns - the region name, the channel,
 and the number of occurrences. Order your table with
 the highest number of occurrences first.
 */
 Select r.name region_name,w.channel channel, Count(*) occurence
 from modeanalytics.parch_and_posey_region r
 Join
 modeanalytics.parch_and_posey_sales_rep s
 on r.id = s.region_id
 JOIN
 modeanalytics.parch_and_posey_account a
 on a.sales_rep_id = s.id
 JOIN
 modeanalytics.parch_and_posey_web_events w
 on w.account_id = a.id
 Group by region_name, channel
 Order by occurence DESC;
