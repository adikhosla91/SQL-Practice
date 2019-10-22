/* Subquery Mania */

/* Question1 : Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales
*/
Select t3.rep_name,t3.region_name,t2.max_sales
FROM
  (Select region_name, Max(total_sales) as max_sales
  From
  (Select s.name as rep_name,r.name as region_name, Sum(o.total_amt_usd) as total_sales
  From sales_reps s
  Join
  region r
  on s.region_id = r.id
  JOIN
  accounts a
  on a.sales_rep_id = s.id
  JOIN
  orders o
  on o.account_id= a.id
  Group by 1,2
  Order by 3 desc) t1
  Group by 1) t2
Join
  (Select s.name as rep_name,r.name as region_name, Sum(o.total_amt_usd) as total_sales
  From sales_reps s
  Join
  region r
  on s.region_id = r.id
  JOIN
  accounts a
  on a.sales_rep_id = s.id
  JOIN
  orders o
  on o.account_id= a.id
  Group by 1,2
  Order by 3 desc) t3
on t3.region_name=t2.region_name and t3.total_sales =t2.max_sales;

/* Question2 : For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?
*/

Select r.name as regions, Count(o.total) as total_orders
From region r
JOIN
sales_reps s
on s.region_id = r.id
JOIN
accounts a
on a.sales_rep_id = s.id
Join
orders o
on o.account_id = a.id
Group by 1
Having sum(o.total_amt_usd)=
            (Select Max(t1.total_sales)
              From
              (Select r.name as region_name, Sum(o.total_amt_usd) as total_sales
              from region r
              Join
              sales_reps s
              on s.region_id = r.id
              JOIN
              accounts a
              on a.sales_rep_id = s.id
              Join
              orders o
              on o.account_id = a.id
              Group by 1) t1);
/* How many accounts had more total purchases than the account name which has
bought the most standard_qty paper throughout their lifetime as a customer?
*/
Select Count(*)
from
      (Select a.name
      from
      accounts a
      Join
      orders o
      on o.account_id = a.id
      Group by 1
      Having sum(o.total) >
                    (Select Max(t1.orders)
                    from
                      (Select a.name as account_name,sum(o.standard_qty) as orders
                      from accounts a
                      JOIN
                      orders o
                      on o.account_id = a.id
                      Group by 1)t1) )t2;

/* For the customer that spent the most (in total over their lifetime as a customer)
total_amt_usd, how many web_events did they have for each channel?
*/
