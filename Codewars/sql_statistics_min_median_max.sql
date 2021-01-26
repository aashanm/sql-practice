-- For this challenge you need to create a simple SELECT statement. Your task is to calculate the MIN, MEDIAN and MAX scores of the students from the results table.

SELECT 
  MIN(score), 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY score) AS median, 
  MAX(score) 
FROM result
