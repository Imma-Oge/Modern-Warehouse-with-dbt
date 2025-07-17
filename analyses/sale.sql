with sale as
(
    select   
     case                  --recalculate sales if original value is missing or incorrect
       when sls_sales is null or sls_sales <=0 or sls_sales !=sls_quantity * sls_price 
        then sls_quantity * abs(sls_price)
        else sls_sales
     end as sls_sales
    from {{ref("stg_sales_details")}}
)
select * from sale