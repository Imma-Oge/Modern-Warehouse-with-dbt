with product_info as
(
    select 
        prd_id as product_id,
        prd_key as product_number,
       replace(left(trim(prd_key),5),'-','_') as category_id,
        prd_nm as product_name,
        coalesce(prd_cost,0) as product_cost,
        case when upper(prd_line) = 'R' then 'Road'
            when upper(prd_line) = 'S' then 'Other Sales'
             when upper(prd_line) = 'M' then 'Mountain'
             when upper(prd_line) = 'T' then 'Touring'
             when upper(prd_line) not in ('R', 'S', 'M' ,'T') OR prd_line is null then 'n/a'
        end as production_line,
        prd_start_dt as start_date,
        lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as end_date
        
    from {{ref("stg_prd_info")}}
      
       
   
)
select * from product_info