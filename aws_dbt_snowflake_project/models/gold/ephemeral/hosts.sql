{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH hosts AS  -- this CTE name ref in dim_hosts.yml file 
(
    SELECT 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
    FROM 
        {{ ref('obt') }}
)
SELECT * FROM hosts