with source as (
    select
        dbt_scd_id as scd_client_id,
        client_id,
        first_name,
        last_name,
        full_name,
        date_of_birth,
        gender,
        phone_number,
        email_address,
        address,
        first_booking,
        last_booking,
        recurrent_client, 
        dbt_updated_at as scd_updated_at,
        dbt_valid_from as scd_valid_from,
        dbt_valid_to as scd_valid_to
    from {{ ref("snapshot_clients") }}
)

select
    scd_client_id,
    client_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    first_booking,
    last_booking,
    recurrent_client, 
    scd_updated_at,
    scd_valid_from,
    scd_valid_to
from source
