{{ config(
    materialized = 'ephemeral'
) }}

WITH listings AS (

SELECT DISTINCT
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    PRICE_PER_NIGHT,
    PRICE_CATEGORY,
    PROPERTY_SIZE,
    GUEST_CAPACITY_CATEGORY,
    LISTINGS_CREATED_AT

FROM {{ ref('obt') }}

)

SELECT * FROM listings