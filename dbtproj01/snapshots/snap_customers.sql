{% snapshot snap_customers_01%}
{{
    config(
        target_database = 'ANALYTICS',
        target_schema = 'DBT',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = ['first_name','last_name'],
        invalidate_hard_deletes = True
    )
}}

SELECT *
FROM {{ref('customers')}}

{%endsnapshot%}