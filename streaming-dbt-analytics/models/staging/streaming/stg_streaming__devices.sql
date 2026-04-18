select
    trim(device_id) as device_id,
    user_id,
    lower(trim(device_type)) as device_type,
    lower(trim(os_name)) as os_name,
    upper(trim(country_code)) as country_code,
    cast(first_seen_at as timestamp) as first_seen_at,
    cast(last_seen_at as timestamp) as last_seen_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'devices') }}
