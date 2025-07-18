with mart_fact_sales as (
    select 
        sls_ord_num,
        prd.product_key,
        cus.customer_key,
        sls_order_dt,
        sls_ship_dt,
        sls_due_dt,
        sls_sales,
        sls_quantity,
        sls_price
    from {{ref ('trans_sales_details')}} as sal
    left join {{ref ('mart_dim_customers')}} as cus
    on sal.sls_cust_id = cus.customer_id
    left join {{ref ('mart_dim_products')}} as prd
    on sal.sls_prd_key = prd.product_number
)

select * from mart_fact_sales