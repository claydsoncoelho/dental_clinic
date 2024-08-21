{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        patient_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        CAST(date_of_birth as DATE) as date_of_birth,
        gender,
        phone_number,
        email_address,
        address,
        how_did_you_find_us,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified
    from {{ source('AZURE_BLOB_DENTAL', 'PATIENTS') }}

)

select
    patient_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    how_did_you_find_us,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
