{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        sales_item_id,
        sales_order_id,
        product_id,
        booking_id,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        CAST(quantity as INT) as quantity,
        CAST(unit_price as NUMBER(18, 2)) as unit_price
    from {{ source('AZURE_BLOB_DENTAL', 'SALES_ITEMS') }}

)

select
    sales_item_id,
    sales_order_id,
    product_id,
    booking_id,
    quantity,
    unit_price,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
