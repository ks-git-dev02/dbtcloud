SELECT 
 customer_id
,COUNT(*)
FROM {{ref('customers')}}
GROUP BY customer_id
HAVING COUNT(*) > 1