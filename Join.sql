Select r.*, a.*
from modeanalytics.parch_and_posey_orders r
Join
modeanalytics.parch_and_posey_account a
on a.id = r.account_id
/*
Try pulling standard_qty, gloss_qty, and poster_qty from the orders table,
and the website and the primary_poc from the accounts table.
*/
Select r.standard_qty,r.gloss_qty,r.poster_qty,
a.website,a.primary_poc
from modeanalytics.parch_and_posey_orders r
Join
modeanalytics.parch_and_posey_account a
on a.id = r.account_id;


/*
Provide a table for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc,
time of the event, and the channel for each event.
Additionally, you might choose to add a fourth column to assure only
Walmart events were chosen.

Provide a table that provides the region for each sales_rep along
with their associated accounts. Your final table should include
three columns: the region name, the sales rep name, and the account name.
 Sort the accounts alphabetically (A-Z) according to account name.

Provide the name for each region for every order, as well as the account name
and the unit price they paid (total_amt_usd/total) for the order.
Your final table should have 3 columns: region name, account name, and unit price.
A few accounts have 0 for total, so I divided by (total + 0.01) to
 assure not dividing by zero.
*/

Select w.channel,w.occurred_at,
a.primary_poc,a.name
from modeanalytics.parch_and_posey_web_events w
Join
modeanalytics.parch_and_posey_account a
on a.id=w.account_id
where name like '%Walmart%';

Select s.name as sales_rep_name ,
r.name as region_name, a.name as account_name
from modeanalytics.parch_and_posey_sales_rep s
Join
modeanalytics.parch_and_posey_account  a
on
s.id = a.sales_rep_id
Join modeanalytics.parch_and_posey_region r
on s.region_id = r.id
order by a.name asc;

Select a.name as account_name,r.name as region_name,
(o.total_amt_usd/(o.total+0.01)) as unit_price
from
modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id =a.sales_rep_id
Join
modeanalytics.parch_and_posey_region r
on
s.region_id = r.id
Join
modeanalytics.parch_and_posey_orders o
on
a.id=o.account_id;

/*
Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for the Midwest region.
Your final table should include three columns: the region name,
the sales rep name, and the account name. Sort the accounts
alphabetically (A-Z) according to account name
*/

Select a.name as account_name,r.name as region_name,
s.name as sales_rep_name
from
modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id =a.sales_rep_id
Join
modeanalytics.parch_and_posey_region r
on
s.region_id = r.id
Where r.name like '%Midwest'
Order by a.name asc;
/*
Provide a table that provides the region for each sales_rep along with their
 associated accounts. This time only for accounts where the sales rep has a
  first name starting with S and in the Midwest region. Your final table
  should include three columns: the region name, the sales rep name, and
  the account name. Sort the accounts alphabetically (A-Z) according to
  account name.
  */
  Select a.name as account_name,r.name as region_name,
  s.name as sales_rep_name
  from
  modeanalytics.parch_and_posey_account a
  Join
  modeanalytics.parch_and_posey_sales_rep s
  on s.id =a.sales_rep_id
  Join
  modeanalytics.parch_and_posey_region r
  on
  s.region_id = r.id
  Where r.name like '%Midwest' and s.name like 'S%'
  Order by a.name asc;

/*
Provide a table that provides the region for each
sales_rep along with their associated accounts.
This time only for accounts where the sales
rep has a last name starting with K and in the Midwest region.
Your final table should include three columns: the region name,
the sales rep name, and the account name. Sort the accounts
alphabetically (A-Z) according to account name.
*/
Select a.name as account_name,r.name as region_name,
s.name as sales_rep_name
from
modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id =a.sales_rep_id
Join
modeanalytics.parch_and_posey_region r
on
s.region_id = r.id
Where r.name like '%Midwest' and s.name like '% K%'
Order by a.name asc;
/*
Provide the name for each region for every order,
as well as the account name and the unit price they paid
(total_amt_usd/total) for the order. However, you should
only provide the results if the standard order quantity exceeds 100.
Your final table should have 3 columns: region name, account name,
and unit price. In order to avoid a division by zero error,
adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
*/
Select a.name as account_name,r.name as region_name,
(o.total_amt_usd/(o.total+0.01)) as unit_price
from
modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id =a.sales_rep_id
Join
modeanalytics.parch_and_posey_region r
on
s.region_id = r.id
Join
modeanalytics.parch_and_posey_orders o
on
a.id=o.account_id
Where o.standard_qty > 1000;

/*
Provide the name for each region for every order,
as well as the account name and the unit price
they paid (total_amt_usd/total) for the order.
However, you should only provide the results if
 the standard order quantity exceeds 100 and the
 poster order quantity exceeds 50. Your final table
 should have 3 columns: region name, account name, and
 unit price. Sort for the smallest unit price first.
 In order to avoid a division by zero error, adding .01 to
 the denominator here is helpful (total_amt_usd/(total+0.01).
*/

Select a.name as account_name,r.name as region_name,
(o.total_amt_usd/(o.total+0.01)) as unit_price
from
modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id =a.sales_rep_id
Join
modeanalytics.parch_and_posey_region r
on
s.region_id = r.id
Join
modeanalytics.parch_and_posey_orders o
on
a.id=o.account_id
Where o.standard_qty > 1000 and o.poster_qty > 50;

/*
What are the different channels used by account id 1001?
Your final table should have only 2 columns:
account name and the different channels.
You can try SELECT DISTINCT to narrow down the results to only the unique values.
*/

Select DISTINCT w.channel, a.name as account_name
from
modeanalytics.parch_and_posey_web_events w
Join
modeanalytics.parch_and_posey_account a
on w.account_id = a.id;
