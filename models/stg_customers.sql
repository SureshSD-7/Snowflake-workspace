-- select
--     id as customer_id,
--     first_name,
--     last_name

-- from raw.jaffle_shop.customers

-- Using sources make it possible to name and describe the data loaded into your warehouse by your extract and load tools.
-- Using source, you can test and document your raw data and also understand the lineage of your sources.

select
    id as customer_id,
    first_name,
    last_name

from {{ source('jaffle_shop', 'customers') }}