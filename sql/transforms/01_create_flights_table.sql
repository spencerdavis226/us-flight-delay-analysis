DROP TABLE IF EXISTS warehouse.flights;

CREATE TABLE warehouse.flights AS
SELECT
    fl_date::TIMESTAMP::DATE AS flight_date,
    op_unique_carrier AS carrier,
    origin,
    dest,
    dep_delay::NUMERIC AS dep_delay,
    arr_delay::NUMERIC AS arr_delay,
    cancelled::NUMERIC::INT AS cancelled,
    diverted::NUMERIC::INT AS diverted,
    distance::NUMERIC AS distance
FROM staging.t_ontime_reporting_raw;
