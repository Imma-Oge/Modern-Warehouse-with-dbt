with category as
( select  
    id as category_id,
    cat as category,
    trim(subcat) as sub_category,
    trim(maintenance) as maintainance 
from {{ref("stg_prd_cat")}}
)
select * from category