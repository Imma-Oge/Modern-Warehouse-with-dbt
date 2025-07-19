with mart_dim_products as 
(
    select
        {{dbt_utils.generate_surrogate_key(['prd_id', 'prd_key'])}} as product_key,  -- Surrogate key
        prd_id as product_id,
        prd_key as product_number,
        prd_nm as product_name,
        p.cat_id as category_id,
        cat as category,
        subcat as sub_category,
        maintenance,
        prd_cost as cost,
        prd_line as product_line,
        prd_start_dt as start_date
    from {{ref("trans_prd_info")}} p
    left join {{ref("trans_prd_cat")}} c 
    on p.cat_id = c.id
    where prd_end_dt is null  -- Filter out all historical data
)
select * from mart_dim_products