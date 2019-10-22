/*
In the accounts table, there is a column holding the website for each company.
The last three digits specify what type of web address they are using.
A list of extensions (and pricing) is provided here.
Pull these extensions and provide how many of each website type exist in the accounts table.
*/

Select right(website,3) as extensions,Count(*) count_websites
from accounts
Group by 1
Order by 2 desc;

/*
There is much debate about how much the name
(or even the first letter of a company name) matters.
Use the accounts table to pull the first letter of each company
name to see the distribution of company names that begin with each letter
(or number).
*/

Select left(name,1) as first_letter, Count(*) as coount_letter
from accounts
Group by 1
Order by 2 desc;

/*
Use the accounts table and a CASE statement to create two groups:
one group of company names that start with a number and a
second group of those company names that start with a letter.
What proportion of company names start with a letter?
*/

Select Sum(num) as number_prop, Sum(letters) as letter_prop
from
  (Select name,
             Case When left(name,1) IN ('0','1','2','3','4','5','6','7','8','9')
             Then 1 Else 0 end as num,
             Case When left(name,1) IN ('0','1','2','3','4','5','6','7','8','9')
             Then 0 Else 1 end as letters
  from accounts) t1 ;

/*
Consider vowels as a, e, i, o, and u.
What proportion of company names start with a vowel,
 and what percent start with anything else?

*/
Select Sum(vowels) as vw, Sum(normal_letters) as norm
From
  (Select name,
              Case When left(Upper(name),1) In ('A','E','I','O','U')
              Then 1 Else 0 end as vowles,
              Case When left(Upper(name),1) In  ('A','E','I','O','U')
              Then 0 Else 1 End as normal_letters
  from accounts) t1;

  /* Postion,STRPOS, SUBSTR */

/*
Use the accounts table to create first and
last name columns that hold the first and last names for the primary_poc.
*/
Select primary_poc,STRPOS(primary_poc,' '),
Left(Upper(primary_poc),STRPOS(Upper(primary_poc), ' ')-1) as First_name,
Right(Upper(primary_poc),(Length(Upper(primary_poc))-STRPOS(Upper(primary_poc),' '))) as Last_name
from accounts;

/*
Now see if you can do the same thing for every rep
name in the sales_reps table. Again provide first and last name columns.
*/

Select name, STRPOS(name,' '),
Left(Upper(name),STRPOS(Upper(name), ' ')-1) as First_name,
Right(Upper(name),(Length(Upper(name))-STRPOS(Upper(name),' '))) as Last_name
from sales_reps;

/*
Concatination */
/*
Each company in the accounts table wants to create an
email address for each primary_poc.
The email address should be the first name of the primary_poc .
last name primary_poc @ company name .com.
*/

Select Concat(First_name,'.',Last_name,'@',company_name,'.com') as email_id
from
  (Select STRPOS(Upper(name),' ') as postion1,
  STRPOS(Upper(primary_poc),' ') as postion2,
  Left(Upper(primary_poc),STRPOS(Upper(primary_poc), ' ')-1) as First_name,
  Right(Upper(primary_poc),(Length(Upper(primary_poc))-STRPOS(Upper(primary_poc),' '))) as Last_name,
  name as company_name
  from accounts) t1;

/*
You may have noticed that in the previous
solution some of the company names include spaces,
which will certainly not work in an email address.
See if you can create an email address that will
 work by removing all of the spaces in the account name,
 but otherwise your solution should be just as in question 1.
*/

Select Concat(First_name,'.',Last_name,'@',new_name,'.com') as email_address
From
  (Select Left(Upper(primary_poc),STRPOS(Upper(primary_poc), ' ')-1) as First_name,
  Right(Upper(primary_poc),(Length(Upper(primary_poc))-STRPOS(Upper(primary_poc),' '))) as Last_name,
  Replace(name,' ','') as new_name
  from accounts) t1;

/*
We would also like to create an initial password,
which they will change after their first log in.
The first password will be the first letter of the primary_poc's first name (lowercase),
then the last letter of their first name (lowercase), the first letter of
their last name (lowercase), the last letter of their last name (lowercase),
the number of letters in their first name, the number of letters in their last name,
and then the name of the company they are working with, all capitalized with no spaces.
*/
Select Concat(first_char,second_char,third_char,fourth_char,fifth_char,sixth_char
                  ,seventh_char) as password
from
  (Select Left(Lower(First_name),1) as first_char, Right(Lower(First_name),1) as second_char,
  Left(lower(Last_name),1) as third_char, Right(Lower(Last_name),3) as fourth_char,
  Length(First_name) as fifth_char, Length(Last_name) as sixth_char, Upper(new_name) as seventh_char
  from
  (Select Left(lower(primary_poc),STRPOS(lower(primary_poc), ' ')-1) as First_name,
  Right(lower(primary_poc),(Length(lower(primary_poc))-STRPOS(Upper(primary_poc),' ') )) as Last_name,
  Replace(name,' ','') as new_name
  from accounts) t1)t2;

/* Cast */

/* Question1
*/
Select date as original_date,
(SUBSTR(date,7,4) || '-' || Left(date,2) ||'-'|| SUBSTR(date,4,2)) as format,
Cast((SUBSTR(date,7,4) || '-' || Left(date,2) ||'-'|| SUBSTR(date,4,2)) as Date) as original_format
from sf_crime_data;

/* Coalesce solution
*/
Select Coalesce(a.id,a.id) filled_id, a.name,a.website,a.lat,
a.long,a.primary_poc,o.*
from accounts a
Left Join
orders o
on o.account_id = a.id
WHERE o.total IS NULL;

/* Question 2
*/
Select Coalesce(a.id,a.id) filled_id,a.name,a.website,a.lat,
a.long,a.primary_poc,Coalesce(o.id,o.id) order_id,Coalesce(o.account_id,a.id)
filled_account_id, o.occurred_at,o.standard_qty,o.poster_qty,o.total,
o.standard_amt_usd,o.gloss_amt_usd,o.poster_amt_usd,o.total_amt_usd
from accounts a
Left Join
orders o
on o.account_id = a.id
Where o.total is Null;

Select Coalesce(a.id,a.id) filled_id,a.name,a.website,a.lat,
a.long,a.primary_poc,Coalesce(o.id,o.id) order_id,Coalesce(o.account_id,a.id)
filled_account_id, o.occurred_at,Coalesce (o.standard_qty,0),Coalesce (o.poster_qty,0),
Coalesce (o.total,0),
Coalesce (o.standard_amt_usd,0),Coalesce (o.gloss_amt_usd,0) ,Coalesce (o.poster_amt_usd,0),
Coalesce (o.total_amt_usd,0)
from accounts a
Left Join
orders o
on o.account_id = a.id
