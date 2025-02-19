
with base as (

    select * 
    from {{ ref('stg_klaviyo__flow_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_klaviyo__flow_tmp')),
                staging_columns=get_flow_columns()
            )
        }}
        {{ fivetran_utils.add_dbt_source_relation() }}
    from base
),

final as (
    
    select 
        created as created_at,
        id as flow_id,
        name as flow_name,
        status,
        {% if target.type == 'snowflake'%}
        "TRIGGER" 
        {% else %}
        trigger
        {% endif %}
        as flow_trigger,
        updated as updated_at,
        customer_filter as person_filter

      {{ fivetran_utils.source_relation() }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * from final