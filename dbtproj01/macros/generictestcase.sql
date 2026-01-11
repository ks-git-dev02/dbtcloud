{% test positive01(model,column_name)%}

SELECT *
FROM {{model}}
WHERE {{column_name}} <= 0

{% endtest%}

{% test valid_date_order(model,start_date,end_date)%}

SELECT *
FROM {{model}}
WHERE 
{{start_date}} IS NOT NULL
AND {{end_date}} IS NOT NULL
AND {{start_date}} > {{end_date}}

{% endtest %}