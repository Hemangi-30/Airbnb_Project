{{ config(
    materialized = 'ephemeral'
) }}

WITH hosts AS (

SELECT DISTINCT
    HOST_ID,
    HOST_NAME,
    HOST_TYPE,
    RESPONSE_RATE,
    HOST_EXPERIENCE_YEARS,
    HOST_CREATED_AT

FROM {{ ref('obt') }}

)

SELECT * FROM hosts