
{{ config(
    materialized = 'incremental',
    unique_key = 'booking_id'
) }}

    SELECT

        BOOKING_ID,

        LISTING_ID,

        BOOKING_DATE,

        COALESCE(NIGHTS_BOOKED, 0) AS NIGHTS_BOOKED,

        COALESCE(BOOKING_AMOUNT, 0) AS BOOKING_AMOUNT,

        COALESCE(CLEANING_FEE, 0) AS CLEANING_FEE,

        COALESCE(SERVICE_FEE, 0) AS SERVICE_FEE,

        UPPER(BOOKING_STATUS) AS BOOKING_STATUS,

        -- Macro Example
        {{ multiply('NIGHTS_BOOKED','BOOKING_AMOUNT',2) }} AS MULTIPLIED_VALUE,

        -- Business Metric
        BOOKING_AMOUNT + CLEANING_FEE + SERVICE_FEE AS TOTAL_REVENUE,

        -- Time Dimensions
        YEAR(BOOKING_DATE) AS BOOKING_YEAR,
        MONTH(BOOKING_DATE) AS BOOKING_MONTH,

        CREATED_AT

    FROM {{ ref('bronze_bookings') }}

    -- Data Validation
    WHERE BOOKING_AMOUNT >= 0

