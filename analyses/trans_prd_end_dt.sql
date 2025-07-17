-- with prod_end_dt as 
-- (
select 
    prd_key,
    prd_start_dt,
    lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as end_date
    from {{ref("stg_prd_info")}}
-- )
-- select * from prod_end_dt