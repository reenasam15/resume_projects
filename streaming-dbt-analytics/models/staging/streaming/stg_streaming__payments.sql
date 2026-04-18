select
    payment_id,
    subscription_id,
    cast(payment_ts as timestamp) as payment_ts,
    cast(amount_usd as double) as amount_usd,
    upper(currency) as currency,
    lower(payment_status) as payment_status,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'payments') }}
