We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.

------------------------------------------------------------------

# idea is to calculate the earnings first and then group by them and sort with limit 1 to get the max instead of MAX()

SELECT salary*months, COUNT(*)
FROM Employee
GROUP BY 1
ORDER BY 1 DESC
LIMIT 1
