DROP TABLE IF EXISTS warehouse.flights;

CREATE TABLE
    warehouse.flights AS
SELECT
    CAST(fl_date AS DATE) AS flight_date,
    op_unique_carrier AS carrier,
    origin,
    dest,
    CAST(dep_delay AS NUMERIC) AS dep_delay,
    CAST(arr_delay AS NUMERIC) AS arr_delay,
    NULLIF(cancelled, '')::NUMERIC::INTEGER AS cancelled,
    NULLIF(diverted, '')::NUMERIC::INTEGER AS diverted,
    CAST(distance AS NUMERIC) AS distance
FROM
    staging.t_ontime_reporting_raw;
