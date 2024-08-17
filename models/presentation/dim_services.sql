with source as (
    select
        dbt_scd_id as scd_service_id,
        service_id,
        service_name,
        description,
        price,
        cost,
        dbt_updated_at as scd_updated_at,
        dbt_valid_from as scd_valid_from,
        dbt_valid_to as scd_valid_to
    from {{ ref("snapshot_services") }}
)

select
    scd_service_id,
    service_id,
    service_name,
    description,
    price,
    cost,
    scd_updated_at,
    scd_valid_from,
    scd_valid_to
from source
