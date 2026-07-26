with finance as (

    select *
    from {{ ref('int_orders_operational') }}

)

select

    date_date,

    count(distinct orders_id) as nb_transactions,

    sum(revenue) as revenue,

    round(
        sum(revenue) / nullif(count(distinct orders_id), 0),
        2
    ) as average_basket,

    sum(margin) as margin,

    sum(operational_margin) as operational_margin,

    sum(purchase_cost) as purchase_cost,

    sum(shipping_fee) as shipping_fee,

    sum(logCost) as log_cost,

    sum(quantity) as quantity

from finance

group by
    date_date

order by
    date_date