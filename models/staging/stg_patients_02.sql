with patient_data as (
    select
        orders.patient_id,
        min(orders.sales_order_date) as first_booking,
        max(orders.sales_order_date) as last_booking,
        case
            when first_booking = last_booking then 'N'
            else 'Y'
        end as recurrent_patient
    from {{ ref("stg_sales_orders") }} orders
    inner join {{ ref("stg_sales_items") }} items
        on orders.sales_order_id = items.sales_order_id
    group by patient_id

),

source as (
    select
        patient.patient_id,
        patient.first_name,
        patient.last_name,
        patient.full_name,
        patient.date_of_birth,
        patient.gender,
        patient.phone_number,
        patient.email_address,
        patient.address,
        patient.how_did_you_hear_about_us, 
        pd.first_booking,
        pd.last_booking,
        pd.recurrent_patient, 
        patient.metadata_filename,
        patient.metadata_file_row_number,
        patient.metadata_file_last_modified
    from {{ ref("stg_patients_01") }} as patient
    left join patient_data as pd
        on patient.patient_id = pd.patient_id
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
    how_did_you_hear_about_us,
    first_booking,
    last_booking,
    recurrent_patient, 
    metadata_filename,
    metadata_file_row_number,
    metadata_file_last_modified
from source