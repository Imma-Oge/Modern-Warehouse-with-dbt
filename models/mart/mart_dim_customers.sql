with mart_dim_customers as (
    select
        {{dbt_utils.generate_surrogate_key(['cst_id', 'cst_key'])}} as customer_key,
        cu.cst_id as customer_id,
        cu.cst_key as customer_number,
        cu.cst_firstname as first_name,
        cu.cst_lastname as last_name,
        lo.cntry as country,
        cu.cst_marital_status as marital_status,
        case 
            when cst_gndr != 'n/a' then cst_gndr
            else coalesce (ca.gen, 'n/a')
        end as gender,
        ca.bdate as birthdate,
        cu.cst_create_date as create_date
    from {{ref ('trans_cust_info')}} as cu
    left join {{ref ('trans_cust_az')}} as ca
    on cu.cst_key = ca.cid
    left join {{ref ('trans_cust_loc')}} as lo
    on cu.cst_key = lo.cid
)

select * from mart_dim_customers