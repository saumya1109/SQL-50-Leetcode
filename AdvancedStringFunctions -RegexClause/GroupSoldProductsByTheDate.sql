/*SELECT col1, col2, ..., colN
GROUP_CONCAT ( [DISTINCT] col_name1 
[ORDER BY clause]  [SEPARATOR str_val] ) 
FROM table_name GROUP BY col_name2;*/

# Write your MySQL query statement below

select sell_date, 
    count(distinct product) as num_sold,
    group_concat(
        distinct product
        order by product
        separator ','
    ) as products
from Activities
group by sell_date
order by sell_date, product