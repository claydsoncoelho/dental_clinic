{% snapshot snapshot_dentists %}

{{
    config(
        target_schema = 'SCD_SNAPSHOTS',
        unique_key = 'DENTIST_ID',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
    DENTIST_ID,
    FIRST_NAME,
    LAST_NAME,
    FULL_NAME, 
    DATE_OF_BIRTH,
    GENDER,
    PHONE_NUMBER,
    EMAIL_ADDRESS,
    ADDRESS, 
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_dentists") }}
{% endsnapshot %}