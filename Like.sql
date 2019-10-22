select * from accounts
where name like '%S';
/*
All the companies whose names start with 'C'
*/
SELECT * FROM accounts
WHERE name like 'C%';
/*
All companies whose names contain the string 'one' somewhere in the name.
*/
SELECT * FROM accounts
WHERE name like '%one%';

/*
All companies whose names end with 's'
*/
SELECT * FROM accounts
WHERE name like '%s';
