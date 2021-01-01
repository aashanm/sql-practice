For this challenge you need to create a SELECT statement, this select statement must have NULL handling, using COALESCE and NULLIF.

If no name is specified you must replace with [product name not found]

If no card_name is specified you must replace with [card name not found]

If no price is specified you must throw away the record, you must also filter the dataset by prices greater than 50.

----------------------------------------------------------------------------------

SELECT 
  id,
  # NULLIF converts '' name values to NULL
  # COALESCE chooses name if not NULL and [product name not found] if NULL as it's the first non-NULL value
  COALESCE(NULLIF(name, ''), '[product name not found]') AS name,
  price,
  COALESCE(NULLIF(card_name, ''), '[card name not found]') AS card_name,
  card_number,
  transaction_date 
  FROM eusales
  WHERE price > 50
