-- select
--     id as order_id,
--     user_id as customer_id,
--     order_date,
--     status

-- from raw.jaffle_shop.orders


select
    id as order_id,
    user_id as customer_id,
    {{dbt_utils.generate_surrogate_key(['id','order_date'])}} as hk_id ,
    cast(coalesce(cast(id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(order_date as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT) as join_id,
    order_date,
    status

from {{ source('jaffle_shop', 'orders') }}

{{limit_data_in_dev('order_date',2500)}}