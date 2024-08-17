with source as (
    SELECT 
        DBT_SCD_ID AS SCD_CLIENT_ID, 
        CLIENT_ID,
        FIRST_NAME,
        LAST_NAME,
        FULL_NAME, 
        DATE_OF_BIRTH,
        GENDER,
        PHONE_NUMBER,
        EMAIL_ADDRESS,
        ADDRESS, 
        DBT_UPDATED_AT AS SCD_UPDATED_AT,
        DBT_VALID_FROM AS SCD_VALID_FROM, 
        DBT_VALID_TO AS SCD_VALID_TO
    FROM {{ ref("snapshot_clients") }}
)

    SELECT
        SCD_CLIENT_ID, 
        CLIENT_ID,
        FIRST_NAME,
        LAST_NAME,
        FULL_NAME, 
        DATE_OF_BIRTH,
        GENDER,
        PHONE_NUMBER,
        EMAIL_ADDRESS,
        ADDRESS, 
        SCD_UPDATED_AT,
        SCD_VALID_FROM,
        SCD_VALID_TO
    FROM source