select
    p.plan_id,
    p.plan_name,
    p.billing_cycle,
    p.price_usd,
    p.ad_tier,
    p.is_active,
    l.plan_family,
    l.max_profiles
from {{ ref('stg_streaming__subscription_plans') }} p
left join {{ ref('plan_type_lookup') }} l using (plan_id)
