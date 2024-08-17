{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        service_id,
        service_name,
        description,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        CAST(price as NUMBER(18, 2)) as price,
        CAST(cost as NUMBER(18, 2)) as cost
    from {{ source('AZURE_BLOB_DENTAL', 'SERVICES') }}
)

select
    service_id,
    service_name,
    description,
    price,
    cost,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
