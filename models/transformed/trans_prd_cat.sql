with category as
( select  
    id as id,
    cat as category,
    subcat as sub_category,
    trim(maintenance) as maintainance 
from {{ref("stg_prd_cat")}}
)
select * from category