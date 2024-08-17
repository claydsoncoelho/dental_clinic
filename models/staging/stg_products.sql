{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        product_id,
        product_name,
        description,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        CAST(cost as NUMBER(18, 2)) as cost,
        CAST(price as NUMBER(18, 2)) as price
    from {{ source('AZURE_BLOB_DENTAL', 'PRODUCTS') }}

)

select
    product_id,
    product_name,
    description,
    cost,
    price,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
