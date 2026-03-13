{% set configs = [
    {
        "table" : "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns" : "SILVER_bookings.*",
        "alias" : "SILVER_bookings"
    },
    { 
        "table" : "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns" : "SILVER_listings.HOST_ID, SILVER_listings.PROPERTY_TYPE, SILVER_listings.ROOM_TYPE, SILVER_listings.CITY, SILVER_listings.COUNTRY, SILVER_listings.ACCOMMODATES, SILVER_listings.BEDROOMS, SILVER_listings.BATHROOMS, SILVER_listings.PRICE_PER_NIGHT, silver_listings.PRICE_PER_NIGHT_TAG, SILVER_listings.CREATED_AT AS LISTING_CREATED_AT",
        "alias" : "SILVER_listings",
        "join_condition" : "SILVER_bookings.listing_id = SILVER_listings.listing_id"
    },
    {
        "table" : "AIRBNB.SILVER.SILVER_HOSTS",
        "columns" : "SILVER_hosts.HOST_NAME, SILVER_hosts.HOST_SINCE, SILVER_hosts.IS_SUPERHOST, SILVER_hosts.RESPONSE_RATE, SILVER_hosts.RESPONSE_RATE_QUALITY, SILVER_hosts.CREATED_AT AS HOST_CREATED_AT",
        "alias" : "SILVER_hosts",
        "join_condition" : "SILVER_listings.host_id = SILVER_hosts.host_id"
    }
] %}

-- table , columns , aliss and join  These values drive the SQL query dynamically.



SELECT 
    {% for col in configs %}
        {{ col['columns'] }}{% if not loop.last %},{% endif %} -- This automatically generates the SELECT columns.
    {% endfor %}
FROM
    {% for config in configs %}
        {% if loop.first %} -- if your table is frist then put as it is 
            {{ config['table'] }} AS {{ config['alias'] }}
        {% else %} -- if table is not first then apply left join and join condition 
            LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }} ON {{ config['join_condition'] }}
        {% endif %}
    {% endfor %}

-- sql query 
{# SELECT
    silver_bookings.*,
    silver_listings.HOST_ID,
    silver_listings.PROPERTY_TYPE,
    silver_hosts.HOST_NAME
FROM 
AIRBNB.SILVER.SILVER_BOOKINGS silver_bookings
LEFT JOIN AIRBNB.SILVER.SILVER_LISTINGS silver_listings
ON silver_bookings.listing_id = silver_listings.listing_id
LEFT JOIN AIRBNB.SILVER.SILVER_HOSTS silver_hosts
ON silver_listings.host_id = silver_hosts.host_id #}