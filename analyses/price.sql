with price as 
(
    select
        case
       when sls_price  is null or sls_price <=0   
        then sls_sales / nullif(sls_quantity,0)
        else sls_price
    end as sls_price
    from {{ref("stg_sales_details")}}
)
select * from price