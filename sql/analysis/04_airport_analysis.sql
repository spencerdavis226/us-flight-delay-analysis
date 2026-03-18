-- Show first 5 rows of the flights table
SELECT
  *
FROM
  warehouse.flights
LIMIT
  5;

-- Which airports have the most departures?
SELECT
  origin,
  COUNT(*) AS total_departures
FROM
  warehouse.flights
GROUP BY
  origin
ORDER BY
  total_departures DESC;
