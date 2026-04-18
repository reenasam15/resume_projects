select
    session_id,
    user_id,
    profile_id,
    device_id,
    title_id,
    session_start_at,
    session_end_at,
    session_minutes,
    event_count,
    completed_flag
from {{ ref('int_session_event_summary') }}
