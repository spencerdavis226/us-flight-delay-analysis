-- Show first 5 rows of the flights table
SELECT
  *
FROM
  warehouse.flights
LIMIT
  5;

-- How many flights were operated by each carrier?
SELECT
  carrier,
  COUNT(*) AS total_flights
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  total_flights DESC;

-- How many flights were cancelled by each carrier?
SELECT
  carrier,
  COUNT(*) AS cancelled_flights
FROM
  warehouse.flights
WHERE
  cancelled = 1
GROUP BY
  carrier
ORDER BY
  cancelled_flights DESC;

-- What percentage of flights were cancelled by each carrier?
SELECT
  carrier,
  (
    COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) * 100.0 / COUNT(*)
  ) AS percentage_cancelled
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  percentage_cancelled DESC;

-- What is the average departure delay for each carrier?
SELECT
  carrier,
  AVG(dep_delay) AS avg_departure_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  carrier
ORDER BY
  avg_departure_delay DESC;

-- What is the average arrival delay for each carrier?
SELECT
  carrier,
  AVG(arr_delay) AS avg_arrival_delay
FROM
  warehouse.flights
WHERE
  cancelled = 0
GROUP BY
  carrier
ORDER BY
  avg_arrival_delay DESC;

-- Which carrier had the highest percentage of delayed departures (departure delay > 15)?
SELECT
  carrier,
  (
    COUNT(*) FILTER (
      WHERE
        dep_delay > 15
        AND cancelled = 0
    ) * 100.0 / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    )
  ) AS percentage_delayed_departure
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  percentage_delayed_departure DESC;

-- Which carrier had the highest percentage of delayed arrivals (arrival delay > 15)?
SELECT
  carrier,
  (
    COUNT(*) FILTER (
      WHERE
        arr_delay > 15
        AND cancelled = 0
    ) * 100.0 / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    )
  ) AS percentage_delayed_arrival
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  percentage_delayed_arrival DESC;

-- Which carrier had the highest percentage of on-time departures (departure delay <= 15)?
SELECT
  carrier,
  (
    COUNT(*) FILTER (
      WHERE
        dep_delay <= 15
        AND cancelled = 0
    ) * 100.0 / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    )
  ) AS percentage_on_time_departure
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  percentage_on_time_departure DESC;
