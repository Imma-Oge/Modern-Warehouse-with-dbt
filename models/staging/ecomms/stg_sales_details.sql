with 

source as (

    select * from {{ source('ecomms', 'sales_details') }}

),

sales_details as (

    select
        sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        sls_order_dt,
        sls_ship_dt,
        sls_due_dt,
        sls_sales,
        sls_quantity,
        sls_price

    from source

)

select * from sales_details
