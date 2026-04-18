select *
from {{ ref('stg_streaming__payments') }}
where payment_status = 'succeeded'
  and amount_usd < 0
