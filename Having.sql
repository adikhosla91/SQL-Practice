/*
How many of the sales reps have more than 5 accounts that they manage?
*/
Select s.name sales_rep,Count(a.id) as accounts
from modeanalytics.parch_and_posey_sales_rep s
JOIN
modeanalytics.parch_and_posey_account a
on s.id = a.sales_rep_id
Group by sales_rep
Having Count(a.id) > 5
Order by accounts desc;

/*
How many of the sales reps have more than 5 accounts that they manage?


How many accounts have more than 20 orders?


Which account has the most orders?


Which accounts spent more than 30,000 usd total across all orders?


Which accounts spent less than 1,000 usd total across all orders?


Which account has spent the most with us?


Which account has spent the least with us?


Which accounts used facebook as a channel to contact customers more than 6 times?


Which account used facebook most as a channel?


Which channel was most frequently used by most accounts?
*/
Select a.name  account_name, Count(o.id) as num_orders
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by account_name
Having Count(o.id) > 20
Order by num_orders desc;

Select a.name  account_name, max(o.total) maximum
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by account_name
order by maximum DESC
limit 1;

Select a.name  account_name, max(o.total_amt_usd) total_cost
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by account_name
Having max(o.total_amt_usd) > 30000
order by total_cost DESC;

Select a.name  account_name, max(o.total_amt_usd) total_cost
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by account_name
Having max(o.total_amt_usd) < 1000
order by total_cost asc;

Select a.name  account_name, max(o.total_amt_usd) total_cost
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_orders o
on a.id = o.account_id
Group by account_name
Having max(o.total_amt_usd) > 30000
order by total_cost DESC
limit 1;

Select a.name account_name, Count(w.channel) channel_Count
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_web_events w
on w.account_id = a.id
Where w.channel like '%facebook'
Group by w.channel,account_m
Having Count(w.channel)> 6
order by channel_Count desc;

Select a.name account_name, Count(w.channel) channel_Count
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_web_events w
on w.account_id = a.id
Where w.channel like '%facebook'
Group by w.channel,account_name
Having Count(w.channel)> 6
order by channel_Count desc
limit 1;

Select a.name account_name, Count(w.channel) channel_Count,
w.channel channel_name
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_web_events w
on w.account_id = a.id
Group by w.channel,account_name
order by channel_Count desc, 
