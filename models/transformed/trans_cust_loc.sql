with
source as (
    select * from {{ref ('stg_cust_loc')}}
),
trans_cust_loc as (
    select
        replace (cid, '-', '') as cid,
        case
            when cntry in ('US', 'United States', 'USA') then 'United States'
            when cntry in ('Germany', 'DE') then 'Germany'
            when cntry in ('Australia', 'Canada', 'France', 'United Kingdom') then cntry
            else 'n\a'
        end as cntry  -- Normalize and Handle missing or blank country codes
    from source
)

select * from trans_cust_loc