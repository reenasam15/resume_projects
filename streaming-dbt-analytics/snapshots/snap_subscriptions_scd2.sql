{% snapshot snap_subscriptions_scd2 %}

{{
  config(
    target_schema='snapshots',
    unique_key='subscription_id',
    strategy='check',
    check_cols=['plan_id', 'status', 'subscription_end_at', 'cancellation_at']
  )
}}

select
  subscription_id,
  user_id,
  plan_id,
  status,
  subscription_start_at,
  subscription_end_at,
  cancellation_at,
  updated_at
from {{ ref('stg_streaming__subscriptions') }}

{% endsnapshot %}
