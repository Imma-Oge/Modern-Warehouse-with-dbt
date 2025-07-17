-- with prd_cost as 
-- (
    select 
        prd_key,
        coalesce(prd_cost,0) as product_cost
    from {{ref("stg_prd_info")}}
    
-- )
-- select product_cost from prd_cost