{% snapshot snapshot_clients %}

{{
    config(
        target_schema = 'dbt_snapshots',
        unique_key = 'CLIENT_ID',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
    CLIENT_ID,
    FIRST_NAME,
    LAST_NAME,
    FULL_NAME, 
    DATE_OF_BIRTH,
    GENDER,
    PHONE_NUMBER,
    EMAIL_ADDRESS,
    ADDRESS, 
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_clients") }}
{% endsnapshot %}