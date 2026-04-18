select
    payment_id,
    subscription_id,
    user_id,
    plan_id,
    payment_ts,
    net_amount_usd,
    payment_status
from {{ ref('int_payment_normalized') }}
