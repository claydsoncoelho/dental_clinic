{% snapshot snapshot_patients %}

{{
    config(
        target_schema = 'SCD_SNAPSHOTS',
        unique_key = 'patient_id',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
    patient_id,
    first_name,
    last_name,
    full_name,
    date_of_birth,
    gender,
    phone_number,
    email_address,
    address,
    how_did_you_find_us,
    first_booking,
    last_booking,
    recurrent_patient, 
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_patients_02") }}
{% endsnapshot %}