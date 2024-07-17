# Write your MySQL query statement below
Select 
    'Low Salary' as category,
    (Select count(income) from Accounts where income < 20000) as accounts_count
Union
Select 
    'Average Salary' as category,
    (Select count(income) 
    from Accounts where income >= 20000 and income<=50000) as accounts_count
Union 
Select 
    'High Salary' as category,
    (Select count(income) from Accounts where income >50000) as accounts_count



