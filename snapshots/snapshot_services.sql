{% snapshot snapshot_services %}

{{
    config(
        target_schema = 'SCD_SNAPSHOTS',
        unique_key = 'SERVICE_ID',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
    SERVICE_ID,
    SERVICE_NAME,
    DESCRIPTION,
    PRICE,
    COST,
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_services") }}
{% endsnapshot %}