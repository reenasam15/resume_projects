select
    date_trunc('day', s.session_start_at) as activity_date,
    s.title_id,
    count(distinct s.session_id) as sessions,
    sum(s.session_minutes) as total_watch_minutes,
    avg(s.session_minutes) as avg_session_minutes,
    sum(s.completed_flag) as completed_sessions
from {{ ref('int_session_event_summary') }} s
group by 1,2
