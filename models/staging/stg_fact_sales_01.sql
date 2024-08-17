WITH source AS (
    SELECT
        si.sales_item_id,
        si.sales_order_id,
        si.product_id,
        bo.service_id,
        bo.dentist_id,
        so.client_id,
        so.payment_method,
        so.status,
        si.quantity,
        si.unit_price, 
        si.quantity * si.unit_price as total_price,
        so.sales_order_date
    FROM {{ ref('stg_sales_items') }} AS si
    INNER JOIN {{ ref('stg_sales_orders') }} AS so
        ON si.sales_order_id = so.sales_order_id
    LEFT JOIN {{ ref('stg_bookings') }} bo 
        ON si.booking_id = bo.booking_id
)

SELECT
    sales_item_id,
    sales_order_id,
    product_id,
    service_id,
    dentist_id,
    client_id,
    payment_method,
    status,
    quantity,
    unit_price, 
    total_price,
    sales_order_date
FROM source
