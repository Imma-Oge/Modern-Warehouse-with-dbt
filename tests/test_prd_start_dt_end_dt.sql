--this test checks for inconsistency in both start and end dates---
select 
    prd_start_dt,
    end_date
from {{ ref('trans_prd_end_dt') }}
where prd_start_dt > end_date