-- Show first 5 rows of flights table (to get an idea of the data)
SELECT
  *
FROM
  warehouse.flights
LIMIT
  5;

-- How many flights are in the dataset?
SELECT
  COUNT(*) AS total_flights
FROM
  warehouse.flights;

-- How many flights were cancelled?
SELECT
  COUNT(*) AS cancelled_flights
FROM
  warehouse.flights
WHERE
  cancelled = 1;

-- How many flights weren't cancelled?
SELECT
  COUNT(*) AS non_cancelled_flights
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What was the average arrival delay for flights that were not cancelled?
SELECT
  AVG(arr_delay) AS avg_arrival_delay_non_cancelled
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What was the median arrival delay for flights that were not cancelled?
SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (
    ORDER BY
      arr_delay
  ) AS median_arrival_delay_non_cancelled
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What was the average departure delay for flights that were not cancelled?
SELECT
  AVG(dep_delay) AS avg_departure_delay_non_cancelled
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What was the median departure delay for flights that were not cancelled?
SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (
    ORDER BY
      dep_delay
  ) AS median_departure_delay_non_cancelled
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- How many flights were diverted?
SELECT
  COUNT(*) AS diverted_flights
FROM
  warehouse.flights
WHERE
  diverted = 1
  AND cancelled = 0;

-- What percentage flights were cancelled?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) * 100.0 / COUNT(*)
  ) AS percentage_cancelled
FROM
  warehouse.flights;

-- What percentage flights were delayed on arrival (arrival delay > 15)?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        arr_delay > 15
    ) * 100.0 / COUNT(*)
  ) AS percentage_delayed_arrival
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What percentage of flights were on time arrival (arrival delay <= 15)?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        arr_delay <= 15
    ) * 100.0 / COUNT(*)
  ) AS percentage_on_time_arrival
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What percentage flights were delayed on departure (departure delay > 15)?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        dep_delay > 15
    ) * 100.0 / COUNT(*)
  ) AS percentage_delayed_departure
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What percentage of flights were on time departure (departure delay <= 15)?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        dep_delay <= 15
    ) * 100.0 / COUNT(*)
  ) AS percentage_on_time_departure
FROM
  warehouse.flights
WHERE
  cancelled = 0;

-- What percentage flights were diverted?
SELECT
  (
    COUNT(*) FILTER (
      WHERE
        diverted = 1
    ) * 100.0 / COUNT(*)
  ) AS percentage_diverted
FROM
  warehouse.flights
WHERE
  cancelled = 0;
