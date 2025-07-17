with mart_dim_products as 
(
    select
        {{dbt_utils.generate_surrogate_key(['product_id', 'product_number'])}} as product_key,
        product_id,
        product_number,
        product_name,
        p.category_id,
        category,
        sub_category,
        maintainance,
        production_line,
        start_date,
         end_date
    from {{ref("trans_prd_info")}} p
    left join {{ref("trans_prd_cat")}} c 
    on p.category_id = c.id
)
select * from mart_dim_products