/*
Use DISTINCT to test if there are any accounts associated
with more than one region
*/

Select DISTINCT a.id account,r.name region
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id = a.sales_rep_id
JOIN
modeanalytics.parch_and_posey_region r
on s.region_id = r.id
Order by account asc;

Select DISTINCT r.name region,a.id account
from modeanalytics.parch_and_posey_account a
Join
modeanalytics.parch_and_posey_sales_rep s
on s.id = a.sales_rep_id
JOIN
modeanalytics.parch_and_posey_region r
on s.region_id = r.id
Order by account asc;

/*
Have any sales reps worked on more than one account?
*/
Select DISTINCT a.id a_id, a.name a_name,s.name sales_rep
from modeanalytics.parch_and_posey_account a
JOIN
modeanalytics.parch_and_posey_sales_rep s
on a.sales_rep_id = s.id
Order by sales_rep;
