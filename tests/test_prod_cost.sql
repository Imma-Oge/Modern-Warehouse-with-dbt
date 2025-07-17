
    select product_cost
    from {{ref("trans_prod_cost")}}
    where product_cost is null
