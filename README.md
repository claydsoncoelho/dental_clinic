Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# to install the dependents. You need to create the packages.yml and populate it with the packages that you want to install:
dbt deps

# to generate the base model (sql):
dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "BOOKINGS"}'
dbt run-operation generate_base_model --args '{"source_name": "AZURE_BLOB_DENTAL", "table_name": "CLIENTS"}'

# to generate the yaml model:
dbt run-operation generate_model_yaml --args '{"model_names": ["stg_bookings"]}'