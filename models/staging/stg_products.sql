{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    SELECT 
        PRODUCT_ID,
        PRODUCT_NAME,
        DESCRIPTION,
        CAST(COST AS NUMBER(18,2)) AS COST,
        CAST(PRICE AS NUMBER(18,2)) AS PRICE,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM {{ source('AZURE_BLOB_DENTAL', 'PRODUCTS') }}

)
    SELECT
        PRODUCT_ID,
        PRODUCT_NAME,
        DESCRIPTION,
        COST,
        PRICE,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM source