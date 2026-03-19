-- Show first 5 rows of the flights table
SELECT
  *
FROM
  warehouse.flights
LIMIT
  5;

-- KPI SUMMARY
SELECT
  COUNT(*) AS total_flights,
  -- Cancellation Rate
  ROUND(
    100.0 * SUM(
      CASE
        WHEN cancelled = 1 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  -- On-Time Arrival Rate (arr_delay <= 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN arr_delay <= 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS on_time_arrival_rate_percent,
  -- Average Arrival Delay
  ROUND(AVG(arr_delay), 2) AS average_arrival_delay_minutes,
  -- Average Departure Delay
  ROUND(AVG(dep_delay), 2) AS average_departure_delay_minutes
FROM
  warehouse.flights;

-- CARRIER PERFORMANCE
SELECT
  carrier,
  COUNT(*) AS total_flights,
  -- Cancellation Rate by Carrier
  ROUND(
    100.0 * SUM(
      CASE
        WHEN cancelled = 1 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  -- Average Arrival Delay by Carrier
  ROUND(AVG(arr_delay), 2) AS average_arrival_delay_minutes,
  -- Average Departure Delay by Carrier
  ROUND(AVG(dep_delay), 2) AS average_departure_delay_minutes,
  -- Percentage of Delayed Flights by Carrier (arr_delay > 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN arr_delay > 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS delayed_flight_percentage
FROM
  warehouse.flights
GROUP BY
  carrier
HAVING
  COUNT(*) > 100
ORDER BY
  average_arrival_delay_minutes DESC;

-- AIRPORT PERFORMANCE
SELECT
  origin AS airport_code,
  COUNT(*) AS total_flights,
  -- Average Departure Delay by Airport
  ROUND(AVG(dep_delay), 2) AS average_departure_delay_minutes,
  -- Average Arrival Delay by Airport
  ROUND(AVG(arr_delay), 2) AS average_arrival_delay_minutes,
  -- Cancellation Rate by Airport
  ROUND(
    100.0 * SUM(
      CASE
        WHEN cancelled = 1 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  -- Percentage of Departure Delays by Airport (dep_delay > 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN dep_delay > 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS departure_delay_percentage,
  -- Percentage of Arrival Delays by Airport (arr_delay > 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN arr_delay > 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS arrival_delay_percentage
FROM
  warehouse.flights
GROUP BY
  origin
HAVING
  COUNT(*) > 100
ORDER BY
  average_arrival_delay_minutes DESC;

-- ROUTE PERFORMANCE
SELECT
  origin,
  dest,
  origin || '->' || dest AS route,
  COUNT(*) AS total_flights,
  -- Average Departure Delay by Route
  ROUND(AVG(dep_delay), 2) AS average_departure_delay_minutes,
  -- Average Arrival Delay by Route
  ROUND(AVG(arr_delay), 2) AS average_arrival_delay_minutes,
  -- Cancellation Rate by Route
  ROUND(
    100.0 * SUM(
      CASE
        WHEN cancelled = 1 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  -- Percentage of Departure Delays by Route (dep_delay > 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN dep_delay > 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS departure_delay_percentage,
  -- Percentage of Arrival Delays by Route (arr_delay > 15 minutes)
  ROUND(
    100.0 * SUM(
      CASE
        WHEN arr_delay > 15 THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS arrival_delay_percentage
FROM
  warehouse.flights
GROUP BY
  origin,
  dest
HAVING
  COUNT(*) > 100
ORDER BY
  average_arrival_delay_minutes DESC;
