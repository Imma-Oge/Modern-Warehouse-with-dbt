with 

source as (

    select * from {{ source('ecomms', 'cust_az') }}

),

cust_az as (

    select
        cid,
        bdate,
        gen

    from source

)

select * from cust_az
