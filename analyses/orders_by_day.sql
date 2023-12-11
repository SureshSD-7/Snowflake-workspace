with orders as (

  select *
  from {{ ref('stg_orders') }}

), payments as (

  select *
  from {{ ref('stg_payments') }}

), daily as(
    select
        order_date,
        count(*) as order_num
    from orders
    group by 1
), employees as(
    select * from {{ ref('employees') }}
), final as(
    select
        orders.customer_id,
        orders.order_date,
        employees.employee_id is not null as is_employee_id
    from orders
    left join employees using (customer_id)                 
)

select*from final
