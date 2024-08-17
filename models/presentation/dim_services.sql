with source as (
    SELECT 
        DBT_SCD_ID AS SCD_SERVICE_ID, 
        SERVICE_ID,
        SERVICE_NAME,
        DESCRIPTION,
        PRICE,
        COST,
        DBT_UPDATED_AT AS SCD_UPDATED_AT,
        DBT_VALID_FROM AS SCD_VALID_FROM, 
        DBT_VALID_TO AS SCD_VALID_TO
    FROM {{ ref("snapshot_services") }}
)

    SELECT
        SCD_SERVICE_ID, 
        SERVICE_ID,
        SERVICE_NAME,
        DESCRIPTION,
        PRICE,
        COST,
        SCD_UPDATED_AT,
        SCD_VALID_FROM,
        SCD_VALID_TO
    FROM source