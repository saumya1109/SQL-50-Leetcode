# Write your MySQL query statement below



/*
Step 1: Format the transaction date to get the month and year.
Step 2: Select the country.
Step 3: Count the total number of transactions for each month and country.
Step 4: Count the number of approved transactions for each month and country.
Step 5: Sum the total transaction amount for each month and country.
Step 6: Sum the total approved transaction amount for each month and country.
Step 7: Group the results by month and country to aggregate the data correctly.
*/

select DATE_FORMAT(trans_date,'%Y-%m') as month
, country
,count(id) as trans_count
,SUM(state='approved') as approved_count
,SUM(amount) as trans_total_amount
,SUM(IF (state='approved', amount, 0)) as approved_total_amount
from Transactions
group by month,country
