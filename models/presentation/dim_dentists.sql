with source as (
    select
        dbt_scd_id as scd_dentist_id,
        dentist_id,
        first_name,
        last_name,
        full_name,
        date_of_birth,
        gender,
        phone_number,
        email_address,
        address,
        dbt_updated_at as scd_updated_at,
        dbt_valid_from as scd_valid_from,
        dbt_valid_to as scd_valid_to
    from {{ ref("snapshot_dentists") }}
)

select
    scd_dentist_id,
    dentist_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    scd_updated_at,
    scd_valid_from,
    scd_valid_to
from source
