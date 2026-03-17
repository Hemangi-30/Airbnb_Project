{{ config(
    materialized = 'ephemeral'
) }}

WITH bookings AS (

SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    BOOKING_YEAR,
    BOOKING_MONTH,
    NIGHTS_BOOKED,
    TOTAL_REVENUE,
    BOOKING_STATUS,
    BOOKING_CREATED_AT

FROM {{ ref('obt') }}

)

SELECT * FROM bookings