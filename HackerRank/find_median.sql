A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

------------------------------------------------------------------

SOLUTION 1:

# Idea is to select value where total record count is greater on both sides of target value

SELECT ROUND(S.LAT_N, 4) 
FROM STATION S 
WHERE (SELECT COUNT(LAT_N) 
       FROM STATION 
       WHERE LAT_N > S.LAT_N) = (SELECT COUNT(LAT_N) 
                                 FROM STATION 
                                 WHERE LAT_N < S.LAT_N);
                                 
------------------------------------------------------------------

SOLUTION 2:

# Idea is to filter top 50 entries descending and then choose max out of those entries

SELECT CAST(MAX(LAT_N) AS DECIMAL(10, 4)) FROM (
    SELECT TOP 50 PERCENT LAT_N
    FROM STATION
    ORDER BY LAT_N) as sub;
