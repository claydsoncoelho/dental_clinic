with source as (
    select distinct payment_method
    from {{ ref("stg_sales_orders") }}
    where payment_method is not null
)

select payment_method
from source
