{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    select
        sales_order as sales_order_id,
        client_id,
        payment_method,
        status,
        metadata_filename,
        metadata_file_row_number,
        metadata_file_last_modified,
        CAST(sales_order_date as DATE) as sales_order_date,
        CAST(total_amount as NUMBER(18, 2)) as total_amount
    from {{ source('AZURE_BLOB_DENTAL', 'SALES_ORDERS') }}
)

select
    sales_order_id,
    client_id,
    sales_order_date,
    total_amount,
    payment_method,
    status,
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
