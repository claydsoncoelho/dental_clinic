{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    SELECT 
        SERVICE_ID,
        SERVICE_NAME,
        DESCRIPTION,
        CAST(PRICE AS NUMBER(18,2)) AS PRICE,
        CAST(COST AS NUMBER(18,2)) AS COST,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM {{ source('AZURE_BLOB_DENTAL', 'SERVICES') }}

)
    SELECT
        SERVICE_ID,
        SERVICE_NAME,
        DESCRIPTION,
        PRICE,
        COST,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM source