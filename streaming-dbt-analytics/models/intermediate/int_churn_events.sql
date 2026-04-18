select
    s.subscription_id,
    s.user_id,
    coalesce(c.effective_at, s.subscription_end_at, s.cancellation_at) as churn_at,
    coalesce(c.reason, 'unknown') as churn_reason
from {{ ref('stg_streaming__subscriptions') }} s
left join {{ ref('stg_streaming__cancellations') }} c using (subscription_id)
where lower(s.status) in ('cancelled', 'expired')
