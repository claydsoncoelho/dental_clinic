WITH source AS (
    SELECT
        fact.sales_item_id,
        fact.sales_order_id,
        dp.scd_product_id,
        fact.product_id,
        ds.scd_service_id, 
        fact.service_id,
        dd.scd_dentist_id, 
        fact.dentist_id,
        dc.scd_patient_id, 
        fact.patient_id,
        fact.payment_method,
        fact.status,
        fact.quantity,
        fact.unit_price,
        total_price,
        product_cost, 
        service_cost, 
        total_cost, 
        sales_order_date
    FROM {{ ref('stg_fact_sales_01') }} AS fact
    LEFT JOIN {{ ref('dim_products') }} AS dp
        ON fact.product_id = dp.product_id
    LEFT JOIN {{ ref('dim_services') }} AS ds
        ON fact.service_id = ds.service_id
    LEFT JOIN {{ ref('dim_dentists') }} AS dd
        ON fact.dentist_id = dd.dentist_id
    LEFT JOIN {{ ref('dim_patients') }} AS dc
        ON fact.patient_id = dc.patient_id
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
    scd_patient_id,
    patient_id,
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
