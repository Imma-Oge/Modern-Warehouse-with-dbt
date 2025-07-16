with
source as (
    select * from {{ref ('stg_cust_az')}}
),

trans_cust_az as (
    select 
        case
            when cid like '%NAS%' then substring (cid, 4, length (cid))
            else cid
        end as cid,
        bdate,
        case 
            when upper (trim (gen)) = 'F' or upper (trim (gen)) = 'FEMALE' then 'Female'
            when upper (trim (gen)) = 'M'  or upper (trim (gen)) = 'MALE' then 'Male'
            else 'n\a'
        end as gen
    from source
)

select * from trans_cust_az