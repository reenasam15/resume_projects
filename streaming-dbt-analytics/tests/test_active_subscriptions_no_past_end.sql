select *
from {{ ref('stg_streaming__subscriptions') }}
where status = 'active'
  and subscription_end_at is not null
  and subscription_end_at < subscription_start_at
