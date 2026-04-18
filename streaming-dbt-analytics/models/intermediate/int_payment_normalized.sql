select
    p.payment_id,
    p.subscription_id,
    s.user_id,
    s.plan_id,
    p.payment_ts,
    case when p.payment_status in ('refund', 'chargeback') then -abs(p.amount_usd) else p.amount_usd end as net_amount_usd,
    p.payment_status
from {{ ref('stg_streaming__payments') }} p
left join {{ ref('stg_streaming__subscriptions') }} s using (subscription_id)
