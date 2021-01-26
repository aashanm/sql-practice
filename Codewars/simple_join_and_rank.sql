/*
For this challenge you need to create a simple SELECT statement that will return all columns from the people table, 
and join to the sales table so that you can return the COUNT of all sales and RANK each person by their sale_count.
*/

SELECT p.id, name, COUNT(sale) AS sale_count, 
  ROW_NUMBER() OVER(ORDER BY COUNT(sale) DESC) AS sale_rank
FROM people p
INNER JOIN sales s
ON p.id = s.people_id
GROUP BY p.id, name
ORDER BY 3 DESC;
