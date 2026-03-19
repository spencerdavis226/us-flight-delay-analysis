-- KPI SUMMARY
SELECT
  COUNT(*) AS total_flights,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND arr_delay <= 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS on_time_arrival_rate_percent,
  ROUND(
    AVG(arr_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_arrival_delay_minutes,
  ROUND(
    AVG(dep_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_departure_delay_minutes
FROM
  warehouse.flights;

-- CARRIER PERFORMANCE
SELECT
  carrier,
  COUNT(*) AS total_flights,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  ROUND(
    AVG(arr_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_arrival_delay_minutes,
  ROUND(
    AVG(dep_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_departure_delay_minutes,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND arr_delay > 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
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
  ROUND(
    AVG(dep_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_departure_delay_minutes,
  ROUND(
    AVG(arr_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_arrival_delay_minutes,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND dep_delay > 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS departure_delay_percentage,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND arr_delay > 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
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
  origin || ' → ' || dest AS route,
  COUNT(*) AS total_flights,
  ROUND(
    AVG(dep_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_departure_delay_minutes,
  ROUND(
    AVG(arr_delay) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS average_arrival_delay_minutes,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 1
    ) / COUNT(*),
    2
  ) AS cancellation_rate_percent,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND dep_delay > 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
    2
  ) AS departure_delay_percentage,
  ROUND(
    100.0 * COUNT(*) FILTER (
      WHERE
        cancelled = 0
        AND arr_delay > 15
    ) / COUNT(*) FILTER (
      WHERE
        cancelled = 0
    ),
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
