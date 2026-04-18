select
    subscription_id,
    user_id,
    plan_id,
    status,
    subscription_start_at,
    subscription_end_at,
    cancellation_at,
    lag(plan_id) over (partition by user_id order by subscription_start_at) as prior_plan_id,
    case when lag(plan_id) over (partition by user_id order by subscription_start_at) is distinct from plan_id then 1 else 0 end as plan_changed_flag
from {{ ref('stg_streaming__subscriptions') }}
