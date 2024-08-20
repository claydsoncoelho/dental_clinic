WITH source AS (
    SELECT
        sales_item_id,
        sales_order_id,
        scd_product_id,
        product_id,
        scd_service_id, 
        service_id, 
        scd_dentist_id,
        dentist_id,
        scd_client_id,
        client_id,
        payment_method,
        status,
        quantity,
        unit_price,
        total_price,
        product_cost, 
        service_cost, 
        total_cost, 
        sales_order_date
    FROM {{ ref('stg_fact_sales_02') }}
)

SELECT
    sales_item_id,
    sales_order_id,
    scd_product_id,
    product_id,
    scd_service_id, 
    service_id, 
    scd_dentist_id,
    dentist_id,
    scd_client_id,
    client_id,
    payment_method,
    status,
    quantity,
    unit_price,
    total_price,
    product_cost, 
    service_cost, 
    total_cost, 
    sales_order_date
FROM source
