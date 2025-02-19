# dbt_klaviyo_source v0.3.0

## Features
- Allow for multiple sources by unioning source tables across multiple Klaviyo connectors.
([#8](https://github.com/fivetran/dbt_klaviyo_source/pull/8) & [#9](https://github.com/fivetran/dbt_klaviyo_source/pull/9))
  - Refer to the [README](https://github.com/fivetran/dbt_klaviyo_source#unioning-multiple-klaviyo-connectors) for more details.

## Under the Hood
- Unioning: The unioning occurs in the tmp models using the `fivetran_utils.union_data` macro. ([#8](https://github.com/fivetran/dbt_klaviyo_source/pull/8))
- Unique tests: Because columns that were previously used for unique tests may now have duplicate fields across multiple sources, these columns are combined with the new `source_relation` column for unique tests and tested using the `dbt_utils.unique_combination_of_columns` macro. ([#8](https://github.com/fivetran/dbt_klaviyo_source/pull/8))
- Source Relation column: To distinguish which source each field comes from, we added a new `source_relation` column in each staging model and applied the `fivetran_utils.source_relation` macro. ([#8](https://github.com/fivetran/dbt_klaviyo_source/pull/8))

## Contributors
- [@pawelngei](https://github.com/pawelngei) [#8](https://github.com/fivetran/dbt_klaviyo_source/pull/8)

# dbt_klaviyo_source v0.1.0 -> v0.3.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!