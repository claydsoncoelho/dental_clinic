{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        booking_id,
        client_id,
        service_id,
        dentist_id,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        CAST(booking_date as DATE) as booking_date,
        CAST(booking_time as TIME) as booking_time,
        CAST(booking_date || ' ' || booking_time as TIMESTAMP)
            as booking_timestamp
    from {{ source("AZURE_BLOB_DENTAL", "BOOKINGS") }}
)

select
    booking_id,
    client_id,
    service_id,
    booking_date,
    booking_time,
    booking_timestamp,
    dentist_id,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
