P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).

--------------------------------------------------------------------------------

SET @row := 21;
SELECT REPEAT("* ", @row := @row - 1)
FROM information_schema.TABLES
WHERE @row > 0;
