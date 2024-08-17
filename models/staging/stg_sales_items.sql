{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    SELECT 
        SALES_ITEM_ID,
        SALES_ORDER_ID,
        PRODUCT_ID,
        BOOKING_ID,
        CAST(QUANTITY AS INT) AS QUANTITY,
        CAST(UNIT_PRICE AS NUMBER(18,2)) AS UNIT_PRICE,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM {{ source('AZURE_BLOB_DENTAL', 'SALES_ITEMS') }}

)
    SELECT
        SALES_ITEM_ID,
        SALES_ORDER_ID,
        PRODUCT_ID,
        BOOKING_ID,
        QUANTITY,
        UNIT_PRICE,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM source