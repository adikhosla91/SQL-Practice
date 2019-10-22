/*
Find the sales in terms of total dollars for all orders in each year,
ordered from greatest to least. Do you notice any trends in the yearly sales totals?


Which month did Parch & Posey have the greatest sales in terms of total
dollars? Are all months evenly represented by the dataset?


Which year did Parch & Posey have the greatest sales in terms of total
number of orders? Are all years evenly represented by the dataset?


Which month did Parch & Posey have the greatest sales in terms of total
number of orders? Are all months evenly represented by the dataset?


In which month of which year did Walmart spend the most on gloss paper in
terms of dollars?
*/
Select Date_Part('year', occurred_at),sum(total)
from modeanalytics.parch_and_posey_orders
Group by 1
order by 2;

Select Date_part('month', occurred_at),sum(total_amt_usd)
from modeanalytics.parch_and_posey_orders
Group by 1
order by 2 desc
limit 1;

Select Date_Part('year', occurred_at),sum(total)
from modeanalytics.parch_and_posey_orders
Group by 1
order by 2 desc
limit 1;

Select Date_Part('month', occurred_at),Count(total) as num_orders
from modeanalytics.parch_and_posey_orders
Group by 1
order by 2 desc;

Select Date_Trunc('month', o.occured_at), sum( o.gloss_amt_usd),
a.name account_name
from modeanalytics.parch_and_posey_orders o
Join
modeanalytics.parch_and_posey_account a
on a.id = o.account_id
Group by 1,3
Having a.name = 'Walmart'
Order by 2 desc
limit 10;
