The cats must by ordered by name and will enter an elevator one by one. We would like to know what the running total weight is.

Return: name, running total weight
Order by: name

---------------------------------------------------------

SELECT name, 
SUM(weight) OVER(ORDER BY name) AS running_total_weight
FROM cats;
