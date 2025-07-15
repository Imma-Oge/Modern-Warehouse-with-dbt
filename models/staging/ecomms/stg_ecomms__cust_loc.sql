with 

source as (

    select * from {{ source('ecomms', 'cust_loc') }}

),

cust_loc as (

    select
        c1 as cid,
        c2 as cntry

    from source

)

select * from cust_loc
