
SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_price,
  SUM(CASE WHEN odometer IS NULL THEN 1 ELSE 0 END) AS null_odometer,
  SUM(CASE WHEN manufacturer IS NULL THEN 1 ELSE 0 END) AS null_manufacturer
FROM vehicles;
*************************
SELECT DISTINCT condition FROM vehicles;

**************************
SELECT 
  id, 
  price, 
  year, 
  2024 - year AS vehicle_age  -- You can change 2024 to current year
FROM vehicles
WHERE year IS NOT NULL AND year >= 1990 AND year <= 2024;

***************************
SELECT 
  manufacturer, 
  COUNT(*) AS listings 
FROM vehicles 
GROUP BY manufacturer 
ORDER BY listings DESC;
