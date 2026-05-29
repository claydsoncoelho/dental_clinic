# Dental Practice Analytics

## Project Overview & Objectives
This project delivered a Dental Practice Analytics Solution, using Python, Snowflake, dbt, Microsoft Azuere and Power BI. The solution uses a Medallion Architecture. The goal is to demonstrate a production-ready environment focusing on:
- **Security & Identity**: Implementing RBAC.
- **dbt Development Best Practices**: Leveraging dbt sources, snapshots, intermediate and mart models.
- **CI/CD Workflow**: Using GitHub repos.

### Technical notes

Try running the following commands:
- dbt run
- dbt test

### Install the dependencies
You need to create the packages.yml and populate it with the packages that you want to install:
- dbt deps

### Generate base model (sql):
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "BOOKINGS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "CLIENTS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "DENTISTS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "PRODUCTS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "SALES_ITEMS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "SALES_ORDERS"}'
- dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "SERVICES"}'

### Generate yaml model:
- dbt run-operation generate_model_yaml --args '{"model_names": ["stg_bookings"]}'
- dbt run-operation generate_model_yaml --args '{"model_names": ["stg_clients", "stg_dentists", "stg_products"]}'
- dbt run-operation generate_model_yaml --args '{"model_names": ["stg_sales_items", "stg_sales_orders", "stg_services"]}'
