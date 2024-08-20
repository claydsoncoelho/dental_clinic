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
        si.quantity * si.unit_price AS total_price,
        si.quantity * pr.cost as product_cost,
        si.quantity * sv.cost as service_cost,
        nvl(product_cost, 0) + nvl(service_cost, 0) as total_cost,
        so.sales_order_date
    FROM {{ ref('stg_sales_items') }} AS si
    INNER JOIN {{ ref('stg_sales_orders') }} AS so
        ON si.sales_order_id = so.sales_order_id
    LEFT JOIN {{ ref('stg_bookings') }} AS bo
        ON si.booking_id = bo.booking_id
    LEFT JOIN {{ ref('stg_products') }} AS pr
        ON si.product_id = pr.product_id
    LEFT JOIN {{ ref('stg_services') }} AS sv
        ON bo.service_id = sv.service_id
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
    product_cost, 
    service_cost, 
    total_cost, 
    sales_order_date
FROM source
