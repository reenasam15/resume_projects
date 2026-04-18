select
    plan_id,
    plan_name,
    lower(billing_cycle) as billing_cycle,
    cast(price_usd as double) as price_usd,
    cast(ad_tier as boolean) as ad_tier,
    cast(is_active as boolean) as is_active,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'subscription_plans') }}
