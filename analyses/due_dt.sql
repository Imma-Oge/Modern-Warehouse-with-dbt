 with due_dt as 
 (
 select 
    to_date (cast(sls_due_dt as varchar),'yyyymmdd') as sls_due_dt
from {{ref("stg_sales_details")}}
    )
    select * from due_dt
   