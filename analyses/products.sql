with products as 
(
    select
        product_id,
        product_key as product_number,
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
    on p.category_id = c.category_id
)
select * from products