with source as (

    select *
    from {{ source('raw', 'ship') }}

),

renamed as (

    select
        shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost

    from source

)

select *
from renamed