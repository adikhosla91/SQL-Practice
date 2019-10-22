/*
Write a query to display for each order, the account ID,
total amount of the order, and the level of the order - ‘Large’ or ’Small’ -
depending on if the order is $3000 or more, or smaller than $3000.
*/

Select account_id,total_amt_usd,
Case When total_amt_usd > 3000 then 'Large'
Else 'Small' End  As Order_classification
from modeanalytics.parch_and_posey_orders;
