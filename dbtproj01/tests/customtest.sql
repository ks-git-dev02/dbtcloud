SELECT *
FROM {{ref('customers')}}
WHERE customer_id < 0