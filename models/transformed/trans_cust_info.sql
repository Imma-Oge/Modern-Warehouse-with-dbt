with

source as (
    select * from {{ref("stg_cust_info")}}

),
trn_cust_info as (
    select 
    	cst_id,
        cst_key,
        trim(cst_firstname) as cst_firstname,
        trim(cst_lastname) as cst_lastname,
        case
            when upper(trim(cst_marital_status)) = 'M' then 'Married'
            when upper(trim(cst_marital_status)) = 'S' then 'Single'
            else 'n/a'
        end as cst_marital_status,  -- Normalize marital status values to readable format
        case
            when upper (trim (cst_gndr)) = 'M' then 'Male'
            when upper (trim (cst_gndr)) = 'F' then 'Female'
            else 'n/a'
        end as cst_gndr,  -- Normalize gender values to readable format
        cst_create_date
    from(
        select *,
        row_number() over(partition by cst_id order by cst_create_date desc) as flag_ship
        from {{ref ('stg_cust_info')}}
        where cst_id is not null
    ) t 
    where flag_ship = 1  -- Select the most recent record per customer
)

select * from trn_cust_info