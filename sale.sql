with sale as
(
    select *
    from {{ref("stg_sales_details")}}
)
select * from sale