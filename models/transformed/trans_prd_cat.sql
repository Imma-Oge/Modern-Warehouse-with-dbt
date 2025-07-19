with category as
( select  
    id,
    cat,
    subcat,
    maintenance
from {{ref("stg_prd_cat")}}
)
select * from category