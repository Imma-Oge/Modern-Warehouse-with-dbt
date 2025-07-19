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
        case 
            when bdate > GETDATE() then null
            else bdate
        end as bdate,   -- Set future birthdates to NULL
        case 
            when upper (trim (gen)) = 'F' or upper (trim (gen)) = 'FEMALE' then 'Female'
            when upper (trim (gen)) = 'M'  or upper (trim (gen)) = 'MALE' then 'Male'
            else 'n\a'
        end as gen  -- Normalize gender values and handle unknown cases
    from source
)

select * from trans_cust_az