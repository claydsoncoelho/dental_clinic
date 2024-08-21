{% snapshot snapshot_clients %}

{{
    config(
        target_schema = 'SCD_SNAPSHOTS',
        unique_key = 'CLIENT_ID',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
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
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_clients_02") }}
{% endsnapshot %}