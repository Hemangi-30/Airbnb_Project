{# {% set night_booked = 10 %}
select * from {{ ref('bronze_bookings') }} where NIGHTS_BOOKED > {{ night_booked }} #}

{% set flag = 10 %}

SELECT * FROM {{ ref('bronze_bookings') }} 
{% if flag == 1 %}
    where NIGHTS_BOOKED > 10
{% else %}
    where NIGHTS_BOOKED = 1
{% endif %}