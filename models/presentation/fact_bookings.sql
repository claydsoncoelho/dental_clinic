WITH source AS (
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
    FROM {{ ref('stg_fact_bookings_01') }}
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
