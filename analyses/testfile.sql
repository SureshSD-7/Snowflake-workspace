{#select count(*) as failures, count(*) != 0 as should_warn, count(*) != 0 as should_error
from
    (

        with
            all_values as (

                select distinct status as value_field

                from analytics.dbt_sureshsd7.stg_orders_dub

            ),

            validation_errors as (

                select value_field from all_values where value_field in ('completed')

            )

        select *
        from validation_errors

    )#}
select count(*) as failures, count(*) != 0 as should_warn, count(*) != 0 as should_error
from
    (

        with
            validation as (
                select

                    sum(case when customer_id is null then 0 else 1 end)
                    / cast(count(*) as numeric) as not_null_proportion
                from analytics.dbt_sureshsd7.stg_orders_dub

            ),
            validation_errors as (
                select not_null_proportion
                from validation
                where not_null_proportion < 2 or not_null_proportion > 1
            )
        select *
        from validation_errors

    )
