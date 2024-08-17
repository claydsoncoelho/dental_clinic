WITH source AS (
    SELECT
        fact.sales_item_id,
        fact.sales_order_id,
        dp.scd_product_id, 
        ds.scd_service_id, 
        dd.scd_dentist_id, 
        dc.scd_client_id, 
        fact.payment_method,
        fact.status,
        fact.quantity,
        fact.unit_price,
        fact.total_price,
        fact.sales_order_date
    FROM {{ ref('stg_fact_sales_01') }} AS fact
    LEFT JOIN {{ ref('dim_products') }} AS dp
        ON fact.product_id = dp.product_id
    LEFT JOIN {{ ref('dim_services') }} AS ds
        ON fact.service_id = ds.service_id
    LEFT JOIN {{ ref('dim_dentists') }} AS dd
        ON fact.dentist_id = dd.dentist_id
    LEFT JOIN {{ ref('dim_clients') }} AS dc
        ON fact.client_id = dc.client_id
)

SELECT
    sales_item_id,
    sales_order_id,
    scd_product_id,
    scd_service_id, 
    scd_dentist_id,
    scd_client_id,
    payment_method,
    status,
    quantity,
    unit_price,
    total_price,
    sales_order_date
FROM source
