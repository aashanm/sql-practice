Given a payment table, which is a part of DVD Rental Sample Database, with the following schema

Column       | Type                        | Modifiers
-------------+-----------------------------+----------
payment_id   | integer                     | not null 
customer_id  | smallint                    | not null
staff_id     | smallint                    | not null
rental_id    | integer                     | not null
amount       | numeric(5,2)                | not null
payment_date | timestamp without time zone | not null
produce a result set for the report that shows a side-by-side comparison of the number and total amounts of payments made in Mike's and Jon's stores broken down by months.

The resulting data set should be ordered by month using natural order (Jan, Feb, Mar, etc.).

Note: You do not need to worry about the year component. Months are never repeated because the sample data set contains payment information only for one year.

The desired output for the report

month | total_count | total_amount | mike_count | mike_amount | jon_count | jon_amount
------+-------------+--------------+------------+-------------+-----------+-----------
2     |             |              |            |             |           |           
5     |             |              |            |             |           |           
...
month - number of the month (1 - January, 2 - February, etc.)
total_count - total number of payments
total_amount - total payment amount
mike_count - total number of payments accepted by Mike (staff_id = 1)
mike_amount - total amount of payments accepted by Mike (staff_id = 1)
jon_count - total number of payments accepted by Jon (staff_id = 2)
jon_amount - total amount of payments accepted by Jon (staff_id = 2)

-----------------------------------------------------------------------------------

SELECT
  DATE_PART('month', payment_date) as month,
  COUNT(rental_id) as total_count,
  SUM(amount) as total_amount,
  SUM(CASE staff_id WHEN 1 THEN 1 ELSE 0 END) as mike_count,
  SUM(CASE staff_id WHEN 1 THEN amount ELSE 0 END) as mike_amount,
  SUM(CASE staff_id WHEN 2 THEN 1 ELSE 0 END) as jon_count,
  SUM(CASE staff_id WHEN 2 THEN amount ELSE 0 END) as jon_amount
FROM payment
GROUP BY date_part('month', payment_date)
ORDER BY date_part('month', payment_date);
