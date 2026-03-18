-- Which carrier had the highest percentage of delayed departures (departure delay > 15)?
SELECT
  carrier,
  (
    COUNT(*) FILTER (
      WHERE
        dep_delay > 15
    ) * 100.0 / COUNT(*)
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
    ) * 100.0 / COUNT(*)
  ) AS percentage_delayed_arrival
FROM
  warehouse.flights
GROUP BY
  carrier
ORDER BY
  percentage_delayed_arrival DESC;

-- Which carrier had the highest average arrival delay for non-cancelled flights?
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

-- Which carrier had the highest average departure delay for non-cancelled flights?
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
