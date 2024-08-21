{{ 
    config(
        materialized='table'
    ) 
}}

with client_data as (
    select
        client_id,
        min(sales_order_date) as first_booking,
        max(sales_order_date) as last_booking,
        case
            when first_booking = last_booking then 'No'
            else 'Yes'
        end as recurrent_client
    from {{ ref("stg_sales_orders") }}
    group by client_id

),

source as (
    select
        client.client_id,
        client.first_name,
        client.last_name,
        client.full_name,
        client.date_of_birth,
        client.gender,
        client.phone_number,
        client.email_address,
        client.address,
        cd.first_booking,
        cd.last_booking,
        cd.recurrent_client, 
        client.metadata_filename,
        client.metadata_file_row_number,
        client.metadata_file_last_modified
    from {{ ref("stg_clients_01") }} as client
    left join client_data as cd
        on client.client_id = cd.client_id
)

select
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
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source
