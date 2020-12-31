P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).

------------------------------------------------------------------------------

# initialize variable counter
SET @row := 0;

# print and iterate over counter
SELECT REPEAT('* ', @row := @row + 1) 

# pull from information schema
FROM information_schema.TABLES

# limit to 20 records
WHERE @row < 20
