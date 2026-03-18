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
  total_departures DESC
LIMIT
  10;

-- Which airports have the highest average departure delay?
SELECT
  origin,
  AVG(dep_delay) AS avg_departure_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
  AND dep_delay IS NOT NULL
GROUP BY
  origin
HAVING
  COUNT(*) > 100
ORDER BY
  avg_departure_delay DESC
LIMIT
  10;

-- Which airports have the highest average arrival delay?
SELECT
  dest,
  AVG(arr_delay) AS avg_arrival_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
  AND arr_delay IS NOT NULL
GROUP BY
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  avg_arrival_delay DESC
LIMIT
  10;

-- Which airports had the highest percentage of delayed departures (departure delay > 15 minutes)?
SELECT
  origin,
  COUNT(*) FILTER (
    WHERE
      dep_delay > 15
  ) * 100.0 / COUNT(*) AS pct_delayed_departures
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin
HAVING
  COUNT(*) > 100
ORDER BY
  pct_delayed_departures DESC
LIMIT
  10;

-- Which airports had the highest percentage of delayed arrivals (arrival delay > 15 minutes)?
SELECT
  dest,
  COUNT(*) FILTER (
    WHERE
      arr_delay > 15
  ) * 100.0 / COUNT(*) AS pct_delayed_arrivals
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  pct_delayed_arrivals DESC
LIMIT
  10;

-- Which airports had the highest percentage of cancellations?
SELECT
  origin,
  COUNT(*) FILTER (
    WHERE
      cancelled = 1
  ) * 100.0 / COUNT(*) AS pct_cancelled
FROM
  warehouse.flights
GROUP BY
  origin
HAVING
  COUNT(*) > 100
ORDER BY
  pct_cancelled DESC
LIMIT
  10;
