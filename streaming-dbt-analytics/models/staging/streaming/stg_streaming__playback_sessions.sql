select
    session_id,
    user_id,
    profile_id,
    trim(device_id) as device_id,
    title_id,
    cast(session_start_at as timestamp) as session_start_at,
    cast(session_end_at as timestamp) as session_end_at,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'playback_sessions') }}
