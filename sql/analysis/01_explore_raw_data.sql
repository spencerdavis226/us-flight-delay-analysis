-- RAW DATA QUERIES
SELECT COUNT(*) FROM staging.t_ontime_reporting_raw;
SELECT DISTINCT origin FROM staging.t_ontime_reporting_raw ORDER BY origin;
SELECT DISTINCT dest FROM staging.t_ontime_reporting_raw ORDER BY dest;

-- Count total cleaned flight rows
SELECT COUNT(*)
FROM warehouse.flights;

-- Preview cleaned flight rows
SELECT *
FROM warehouse.flights
LIMIT 10;

-- See which carriers are in the data
SELECT DISTINCT carrier
FROM warehouse.flights
ORDER BY carrier;

-- See Tampa-related flights
SELECT *
FROM warehouse.flights
WHERE origin = 'TPA' OR dest = 'TPA'
LIMIT 10;

-- Count total flights by carrier
SELECT carrier, COUNT(*) AS total_flights
FROM warehouse.flights
GROUP BY carrier
ORDER BY total_flights DESC;

-- Flights by carrier (Tampa only)
SELECT carrier, COUNT(*) AS total_flights
FROM warehouse.flights
WHERE origin = 'TPA' OR dest = 'TPA'
GROUP BY carrier
ORDER BY total_flights DESC;

-- Average arrival delay by carrier (Tampa only)
SELECT carrier, AVG(arr_delay) AS avg_arrival_delay
FROM warehouse.flights
WHERE origin = 'TPA' OR dest = 'TPA'
GROUP BY carrier
ORDER BY avg_arrival_delay DESC;

SELECT MIN(flight_date), MAX(flight_date)
FROM warehouse.flights;
