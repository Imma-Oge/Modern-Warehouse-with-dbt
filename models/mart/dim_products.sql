with mart_dim_products as
(
    select
        {{dbt_utils.generate_surrogate_key(['cst_id', 'cst_key'])}} as customer_key,
)