WITH source AS (
    SELECT
        fact.booking_id,
        dpat.scd_patient_id,
        fact.patient_id,
        ds.scd_service_id,
        fact.service_id,
        dd.scd_dentist_id,
        fact.dentist_id,
        fact.booking_status,
        fact.booking_date,
        fact.booking_time,
        fact.booking_timestamp
    FROM {{ ref('stg_bookings') }} fact
    LEFT JOIN {{ ref('dim_services') }} AS ds
        ON fact.service_id = ds.service_id
    LEFT JOIN {{ ref('dim_dentists') }} AS dd
        ON fact.dentist_id = dd.dentist_id
    LEFT JOIN {{ ref('dim_patients') }} AS dpat
        ON fact.patient_id = dpat.patient_id
)

SELECT
    booking_id,
    scd_patient_id,
    patient_id,
    scd_service_id,
    service_id,
    scd_dentist_id,
    dentist_id,
    booking_status,
    booking_date,
    booking_time,
    booking_timestamp
FROM source
