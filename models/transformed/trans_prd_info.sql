with product_info as
(
    select 
        prd_id,
        substring (prd_key, 7, len(prd_key)) as prd_key,  -- Extract product key
        replace(left(trim(prd_key),5),'-','_') as cat_id,  -- Extract category ID
        prd_nm,
        coalesce(prd_cost,0) as prd_cost,
        case when upper(trim(prd_line)) = 'R' then 'Road'
             when upper(trim(prd_line)) = 'S' then 'Other Sales'
             when upper(trim(prd_line)) = 'M' then 'Mountain'
             when upper(trim(prd_line)) = 'T' then 'Touring'
             else 'n/a'
        end as prd_line,  -- Map product line codes to descriptive values
        prd_start_dt,
        lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as prd_end_dt  -- Calculate end date as one day before the next start date
        
    from {{ref("stg_prd_info")}}
      
       
   
)
select * from product_info