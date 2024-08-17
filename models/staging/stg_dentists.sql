{{ 
    config(
        materialized='table'
    ) 
}}

with source as (
    SELECT 
        DENTIST_ID,
        FIRST_NAME,
        LAST_NAME,
        FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
        CAST(DATE_OF_BIRTH AS DATE) AS DATE_OF_BIRTH,
        GENDER,
        PHONE_NUMBER,
        EMAIL_ADDRESS,
        ADDRESS,
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM {{ source('AZURE_BLOB_DENTAL', 'DENTISTS') }}

)
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
        METADATA_FILENAME,
        METADATA_FILE_ROW_NUMBER,
        METADATA_FILE_LAST_MODIFIED
    FROM source