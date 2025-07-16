with 

source as (

    select * from {{ source('ecomms', 'prd_info') }}

),

prd_info as (

    select
        prd_id,
        prd_key,
        prd_nm,
        prd_cost,
        prd_line,
        prd_start_dt,
        prd_end_dt

    from source

)

select * from prd_info
