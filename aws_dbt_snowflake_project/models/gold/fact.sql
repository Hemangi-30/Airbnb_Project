{{ config(
    materialized='table'
) }}

{% set configs = [

    {
        "table": "AIRBNB.GOLD.OBT",
        "columns": "obt.BOOKING_ID,
                    obt.LISTING_ID,
                    obt.HOST_ID,
                    obt.NIGHTS_BOOKED,
                    obt.TOTAL_REVENUE,
                    obt.BOOKING_DATE,
                    obt.BOOKING_YEAR,
                    obt.BOOKING_MONTH",
        "alias": "obt"
    },

    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "dim_listings",
        "join_condition": "obt.LISTING_ID = dim_listings.LISTING_ID"
    },

    {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "columns": "",
        "alias": "dim_hosts",
        "join_condition": "obt.HOST_ID = dim_hosts.HOST_ID"
    },

    {
        "table": "AIRBNB.GOLD.DIM_BOOKINGS",
        "columns": "",
        "alias": "dim_bookings",
        "join_condition": "obt.BOOKING_ID = dim_bookings.BOOKING_ID"
    }

] %}


SELECT
    {{ configs[0]['columns'] }}

FROM

{% for config in configs %}

    {% if loop.first %}

        {{ config['table'] }} AS {{ config['alias'] }}

    {% else %}

        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}

    {% endif %}

{% endfor %}

{# {{ config(
    materialized='table'
) }}

{% set cols = [

"BOOKING_ID",
"LISTING_ID",
"HOST_ID",
"BOOKING_DATE",
"BOOKING_YEAR",
"BOOKING_MONTH",
"NIGHTS_BOOKED",
"TOTAL_REVENUE"

] %}

SELECT

{% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
{% endfor %}

FROM {{ ref('obt') }} #}