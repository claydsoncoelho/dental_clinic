{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        dentist_id,
        first_name,
        last_name,
        gender,
        phone_number,
        email_address,
        address,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        first_name || ' ' || last_name as full_name,
        CAST(date_of_birth as DATE) as date_of_birth
    from {{ source('AZURE_BLOB_DENTAL', 'DENTISTS') }}

)

select
    dentist_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
