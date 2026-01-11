{{config(
    materialized = 'incremental',
    unique_key = 'order_id',
    incremental_strategy = 'merge',
    on_schema_change = 'sync'
)}}

SELECT
o.order_id,
o.customer_id,
o.order_date,
o.status

FROM {{ref("stg_orders")}} o

{% if is_incremental() %}

WHERE o.order_date > (SELECT COALESCE(MAX(order_date),'1900-01-01') FROM {{ this }} ) 

{% endif %}