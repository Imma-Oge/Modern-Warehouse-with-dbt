with 

source as (

    select * from {{ source('ecomms', 'cust_info') }}

),

cust_info as (

    select
        cst_id,
        cst_key,
        cst_firstname,
        cst_lastname,
        cst_marital_status,
        cst_gndr,
        cst_create_date

    from source

)

select * from cust_info
