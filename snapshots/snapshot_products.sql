{% snapshot snapshot_products %}

{{
    config(
        target_schema = 'SCD_SNAPSHOTS',
        unique_key = 'PRODUCT_ID',
        strategy = 'timestamp',
        updated_at = 'METADATA_FILE_LAST_MODIFIED'
    )
}}

SELECT 
    PRODUCT_ID,
    PRODUCT_NAME,
    DESCRIPTION,
    COST,
    PRICE,
    METADATA_FILE_LAST_MODIFIED
FROM {{ ref("stg_products") }}
{% endsnapshot %}