{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    SELECT 
        SALES_ORDER,
        CLIENT_ID,
        CAST(SALES_ORDER_DATE AS DATE) AS SALES_ORDER_DATE,
        CAST(TOTAL_AMOUNT AS NUMBER(18,2)) AS TOTAL_AMOUNT,
        PAYMENT_METHOD,
        STATUS,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM {{ source('AZURE_BLOB_DENTAL', 'SALES_ORDERS') }}

)
    SELECT
        SALES_ORDER,
        CLIENT_ID,
        SALES_ORDER_DATE,
        TOTAL_AMOUNT,
        PAYMENT_METHOD,
        STATUS,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM source