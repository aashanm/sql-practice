Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

---------------------------------------------------------------------------------

# set variables to iterate over number of rows necessary
SET @r1=0, @r2=0, @r3=0, @r4=0;

# select value from each row corresponding to field (min/max necessary due to group by)
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor) 
FROM (
SELECT
    # create new column with row number that increments once occupation is found
    CASE WHEN Occupation='Doctor' THEN (@r1:=@r1+1)
         WHEN Occupation='Professor' THEN (@r2:=@r2+1)
         WHEN Occupation='Singer' THEN (@r3:=@r3+1)
         WHEN Occupation='Actor' THEN (@r4:=@r4+1) END AS RowNumber,
    # categorize names by occupation
    CASE WHEN Occupation='Doctor' THEN Name END AS Doctor,
    CASE WHEN Occupation='Professor' THEN Name END AS Professor,
    CASE WHEN Occupation='Singer' THEN Name END AS Singer,
    CASE WHEN Occupation='Actor' THEN Name END AS Actor
FROM OCCUPATIONS
# sort in alphabetical order
ORDER BY Name) AS sub
# combine records based on row number
GROUP BY RowNumber;
