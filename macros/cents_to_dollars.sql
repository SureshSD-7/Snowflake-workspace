{% macro cents_to_dollars(column_name, decimal_places=2) %}
    round( 1.0 * {{ column_name }} / 100, {{ decimal_places }})
{% endmacro %}

{#
  {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2020-01-01' as date)"
   )
}}
#}