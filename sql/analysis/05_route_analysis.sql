-- Show first 5 rows of the flights table
SELECT
  *
FROM
  warehouse.flights
LIMIT
  5;

-- Which routes have the most flights?
SELECT
  origin,
  dest,
  COUNT(*) AS total_flights
FROM
  warehouse.flights
GROUP BY
  origin,
  dest
ORDER BY
  total_flights DESC
LIMIT
  10;

-- Which routes have the highest average departure delay?
SELECT
  origin,
  dest,
  AVG(dep_delay) AS avg_dep_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin,
  dest
ORDER BY
  avg_dep_delay DESC
LIMIT
  10;

-- Which routes have the lowest average departure delay?
SELECT
  origin,
  dest,
  AVG(dep_delay) AS avg_dep_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin,
  dest
ORDER BY
  avg_dep_delay ASC
LIMIT
  10;

-- Which routes have the highest average arrival delay?
SELECT
  origin,
  dest,
  AVG(arr_delay) AS avg_arr_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
  AND arr_delay IS NOT NULL
GROUP BY
  origin,
  dest
ORDER BY
  avg_arr_delay DESC
LIMIT
  10;

-- Which routes have the lowest average arrival delay?
SELECT
  origin,
  dest,
  AVG(arr_delay) AS avg_arr_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin,
  dest
ORDER BY
  avg_arr_delay ASC
LIMIT
  10;

-- Which routes have the highest percentage of delayed departures (departure delay > 15 minutes)?
SELECT
  origin,
  dest,
  COUNT(*) FILTER (
    WHERE
      dep_delay > 15
  ) * 100.0 / COUNT(*) AS dep_pct_delayed
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin,
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  dep_pct_delayed DESC
LIMIT
  10;

-- Which routes have the highest percentage of delayed arrivals (arrival delay > 15 minutes)?
SELECT
  origin,
  dest,
  COUNT(*) FILTER (
    WHERE
      arr_delay > 15
  ) * 100.0 / COUNT(*) AS arr_pct_delayed
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  origin,
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  arr_pct_delayed DESC
LIMIT
  10;

-- Which routes have the highest percentage of cancellations?
SELECT
  origin,
  dest,
  COUNT(*) FILTER (
    WHERE
      cancelled = 1
  ) * 100.0 / COUNT(*) AS pct_cancelled
FROM
  warehouse.flights
GROUP BY
  origin,
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  pct_cancelled DESC
LIMIT
  10;
