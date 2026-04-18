select
    subscription_id,
    user_id,
    plan_id,
    lower(status) as status,
    cast(start_at as timestamp) as subscription_start_at,
    cast(end_at as timestamp) as subscription_end_at,
    cast(cancel_at as timestamp) as cancellation_at,
    cast(updated_at as timestamp) as updated_at,
    {{ generate_surrogate_key(['subscription_id', 'updated_at']) }} as subscription_sk,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'subscriptions') }}
qualify row_number() over (partition by subscription_id order by cast(updated_at as timestamp) desc) = 1
