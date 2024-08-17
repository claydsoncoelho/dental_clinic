with source as (
    select distinct status as payment_status
    from {{ ref("stg_sales_orders") }}
)

select payment_status
from source
