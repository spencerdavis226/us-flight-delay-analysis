SELECT COUNT(*) FROM staging.t_ontime_reporting_raw;

SELECT DISTINCT origin FROM staging.t_ontime_reporting_raw ORDER BY origin;

SELECT DISTINCT dest FROM staging.t_ontime_reporting_raw ORDER BY dest;

SELECT *
FROM warehouse.flights
LIMIT 10;

SELECT COUNT(*)
FROM warehouse.flights;
