with trans_sales_details as 
(
    select 
        sls_ord_num, 
        sls_prd_key,
        sls_cust_id,
        case 
         when sls_order_dt <= 0 or length(sls_order_dt) != 8 or sls_order_dt < 19000101
            or  sls_order_dt > 20500101 then null 
         else cast (cast(sls_order_dt as varchar) as date)
        end as sls_order_dt,
        case 
         when sls_due_dt <= 0 or length(sls_due_dt)!=8 or sls_due_dt < 19000101 
         or sls_due_dt > 20500101 then null 
         else cast (cast(sls_due_dt as varchar) as date)
        end as sls_due_dt,
        case 
         when sls_ship_dt <=0 or length(sls_ship_dt) != 8 or sls_ship_dt < 19000101 
         or sls_ship_dt > 20500101 then null 
         else cast (cast(sls_ship_dt as varchar) as date)
        end as sls_ship_dt,
        case                  --recalculate sales if original value is missing or incorrect
         when sls_sales is null or sls_sales <=0 or sls_sales != sls_quantity * abs(sls_price) 
            then sls_quantity * abs(sls_price)
            else sls_sales
        end as sls_sales,
        sls_quantity,
        case
         when sls_price  is null or sls_price <=0   
            then sls_sales / nullif(sls_quantity,0)
         else sls_price
        end as sls_price  -- Derive price if original value is invalid
    from {{ref("stg_sales_details")}}

)
select * from trans_sales_details