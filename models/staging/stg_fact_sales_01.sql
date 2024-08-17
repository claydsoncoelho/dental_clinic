WITH source AS (
    SELECT
        si.sales_item_id,
        si.sales_order_id,
        si.product_id,
        si.booking_id,
        si.quantity,
        si.unit_price,
        so.client_id,
        so.sales_order_date,
        so.payment_method,
        so.status
    FROM {{ ref('stg_sales_items') }} AS si
    INNER JOIN {{ ref('stg_sales_orders') }} AS so
        ON si.sales_order_id = so.sales_order_id
)

SELECT
    sales_item_id,
    sales_order_id,
    product_id,
    booking_id,
    quantity,
    unit_price,
    client_id,
    sales_order_date,
    payment_method,
    status
FROM source
