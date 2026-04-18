with starts as (
    select date_trunc('month', subscription_start_at) as month, count(*) as starts
    from {{ ref('fct_subscription_events') }}
    group by 1
), churn as (
    select date_trunc('month', churn_at) as month, count(*) as churns
    from {{ ref('int_churn_events') }}
    group by 1
)
select
    coalesce(s.month, c.month) as month,
    coalesce(s.starts, 0) as subscription_starts,
    coalesce(c.churns, 0) as churns,
    {{ safe_divide('coalesce(c.churns,0)', 'nullif(coalesce(s.starts,0),0)') }} as churn_rate
from starts s
full outer join churn c on s.month = c.month
