with source as (
    select
        dbt_scd_id as scd_product_id,
        product_id,
        product_name,
        description,
        cost,
        price,
        dbt_updated_at as scd_updated_at,
        dbt_valid_from as scd_valid_from,
        dbt_valid_to as scd_valid_to
    from {{ ref("snapshot_products") }}
)

select
    scd_product_id,
    product_id,
    product_name,
    description,
    cost,
    price,
    scd_updated_at,
    scd_valid_from,
    scd_valid_to
from source
