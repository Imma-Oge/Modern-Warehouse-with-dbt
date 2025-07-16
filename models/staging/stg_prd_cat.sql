with 

source as (

    select * from {{ source('ecomms', 'prd_cat') }}

),

prd_cat as (

    select
        id,
        cat,
        subcat,
        maintenance

    from source

)

select * from prd_cat
