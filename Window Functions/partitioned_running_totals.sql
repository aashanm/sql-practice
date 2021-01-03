The cats must by ordered first by breed and second by name. They are about to enter an elevator one by one. When all the cats of the same breed have entered they leave.

We would like to know what the running total weight of the cats is.

Return: name, breed, running total weight
Order by: breed, name

-----------------------------------------------------------------------------------------

SELECT name, breed, 
    SUM(weight) OVER(PARTITION BY breed ORDER BY name) AS running_total_weight
FROM cats
ORDER BY breed, name;
