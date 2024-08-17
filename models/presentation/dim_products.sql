with source as (
    SELECT 
        DBT_SCD_ID AS SCD_PRODUCT_ID, 
        PRODUCT_ID,
        PRODUCT_NAME,
        DESCRIPTION,
        COST,
        PRICE,
        DBT_UPDATED_AT AS SCD_UPDATED_AT,
        DBT_VALID_FROM AS SCD_VALID_FROM, 
        DBT_VALID_TO AS SCD_VALID_TO
    FROM {{ ref("snapshot_products") }}
)

    SELECT
        SCD_PRODUCT_ID, 
        PRODUCT_ID,
        PRODUCT_NAME,
        DESCRIPTION,
        COST,
        PRICE,
        SCD_UPDATED_AT,
        SCD_VALID_FROM,
        SCD_VALID_TO
    FROM source