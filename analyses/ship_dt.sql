with ship_dt  as 
(
 select 
     case 
       when sls_ship_dt <=0 
        or  length(sls_ship_dt)!=8   or  sls_ship_dt<19000101 or sls_ship_dt>20500101
        then null 
        else to_date (cast(sls_ship_dt as varchar),'yyyymmdd')
        end as sls_ship_dt
    from {{ref("stg_sales_details")}}             
)
select * from ship_dt
    