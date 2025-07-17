with prd_test as
  (
     select category_id 
from {{ref("trans_prd_info")}}
  ) 
  select category_id
  from {{ref("trans_prd_cat")}}
where category_id not in (select * from prd_test) 