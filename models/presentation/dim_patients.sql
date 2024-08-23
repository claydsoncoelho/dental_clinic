with source as (
    select
        dbt_scd_id as scd_patient_id,
        patient_id,
        first_name,
        last_name,
        full_name,
        date_of_birth,
        gender,
        phone_number,
        email_address,
        address,
        how_did_you_hear_about_us,
        first_booking,
        last_booking,
        recurrent_patient, 
        dbt_updated_at as scd_updated_at,
        dbt_valid_from as scd_valid_from,
        dbt_valid_to as scd_valid_to
    from {{ ref("snapshot_patients") }}
)

select
    scd_patient_id,
    patient_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    how_did_you_hear_about_us,
    first_booking,
    last_booking,
    recurrent_patient, 
    scd_updated_at,
    scd_valid_from,
    scd_valid_to
from source
