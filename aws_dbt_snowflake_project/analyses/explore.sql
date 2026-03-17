-- select * from {{ ref('bronze_bookings') }}

-- select * from {{ ref('bronze_listings') }}

-- select * from {{ ref('bronze_hosts') }}

{# SELECT COUNT(DISTINCT BOOKING_ID)
FROM {{ ref('obt') }} #}

SELECT COUNT(*) 
FROM {{ ref('obt') }}