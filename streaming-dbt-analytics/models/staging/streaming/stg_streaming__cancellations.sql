select
    cancellation_id,
    subscription_id,
    cast(requested_at as timestamp) as requested_at,
    cast(effective_at as timestamp) as effective_at,
    lower(reason) as reason,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'cancellations') }}
