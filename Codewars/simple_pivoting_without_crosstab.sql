You need to build a pivot table WITHOUT using CROSSTAB function. 
Having two tables products and details you need to select a pivot table of products with counts of details occurrences (possible details values are ['good', 'ok', 'bad'].

Results should be ordered by product''s name.

----------------------------------------------------------------------------------------

SELECT p.name, 
  COUNT(CASE WHEN detail = 'good' THEN DETAIL END) AS good,
  COUNT(CASE WHEN detail = 'ok' THEN DETAIL END) AS ok,
  COUNT(CASE WHEN detail = 'bad' THEN DETAIL END) AS bad
FROM products AS p
JOIN details AS d
ON p.id = d.product_id
GROUP BY p.name
ORDER BY p.name;
