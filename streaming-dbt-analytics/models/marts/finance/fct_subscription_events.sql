select
    subscription_id,
    user_id,
    plan_id,
    status,
    subscription_start_at,
    subscription_end_at,
    cancellation_at,
    plan_changed_flag
from {{ ref('int_user_subscription_history') }}
