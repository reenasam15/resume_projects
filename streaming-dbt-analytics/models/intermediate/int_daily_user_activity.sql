select
    date_trunc('day', session_start_at) as activity_date,
    user_id,
    count(distinct session_id) as sessions,
    sum(session_minutes) as watch_minutes
from {{ ref('int_session_event_summary') }}
group by 1,2
