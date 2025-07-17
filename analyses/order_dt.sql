with order_dt as 
(
   select 
    sls_ord_num, 
    sls_prd_key,
    sls_cust_id,
   case 
      when sls_order_dt <=0 or  length(sls_order_dt)!=8  or  sls_order_dt<19000101
       or  sls_order_dt>20500101
        then null 
      else to_date (cast(sls_order_dt as varchar),'yyyymmdd')
    end as sls_order_dt 
   
    from {{ref("stg_sales_details")}}
)
select * from order_dt
 