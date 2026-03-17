{% set configs = [

{
    "table": ref('silver_bookings'),
    "columns": "
        b.BOOKING_ID,
        b.BOOKING_DATE,
        b.BOOKING_YEAR,
        b.BOOKING_MONTH,
        b.NIGHTS_BOOKED,
        b.TOTAL_REVENUE,
        b.BOOKING_STATUS,
        b.LISTING_ID,
        b.CREATED_AT as BOOKING_CREATED_AT
    ",
    "alias": 'b'
},

{
    "table": ref('silver_listings'),
    "columns": "
        l.PROPERTY_TYPE,
        l.ROOM_TYPE,
        l.CITY,
        l.COUNTRY,
        l.PRICE_PER_NIGHT,
        l.PRICE_CATEGORY,
        l.PROPERTY_SIZE,
        l.GUEST_CAPACITY_CATEGORY,
        l.HOST_ID,
        l.CREATED_AT as LISTINGS_CREATED_AT
    ",
    "alias": 'l',
    "join_condition": "b.LISTING_ID = l.LISTING_ID"
},

{
    "table": ref('silver_hosts'),
    "columns": "
        h.HOST_NAME,
        h.HOST_TYPE,
        h.RESPONSE_RATE,
        h.HOST_EXPERIENCE_YEARS,
        h.CREATED_AT as HOST_CREATED_AT
    ",
    "alias": 'h',
    "join_condition": "l.HOST_ID = h.HOST_ID"
}

] %}


SELECT
{% for col in configs %}
    {{ col['columns'] }}{% if not loop.last %},{% endif %}
{% endfor %}

FROM

{% for config in configs %}
    
    {% if loop.first %}
        {{ config['table'] }} AS {{ config['alias'] }}
    
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
    
    {% endif %}

{% endfor %}



