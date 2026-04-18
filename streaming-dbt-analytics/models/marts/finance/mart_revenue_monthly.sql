select
    date_trunc('month', payment_ts) as revenue_month,
    plan_id,
    sum(net_amount_usd) as revenue_usd
from {{ ref('fct_payments') }}
group by 1,2
