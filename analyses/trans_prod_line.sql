with prod_line as (


select 
    prd_key,
    case when upper(prd_line) = 'R' then 'Road'
         when upper(prd_line) = 'S' then 'Other Sales'
         when upper(prd_line) = 'M' then 'Mountain'
         when upper(prd_line) = 'T' then 'Touring'
         when upper(prd_line) not in ('R', 'S', 'M' ,'T') OR prd_line is null then 'n/a'
    end as production_line
from {{ ref('stg_prd_info') }}
)
select * from prod_line