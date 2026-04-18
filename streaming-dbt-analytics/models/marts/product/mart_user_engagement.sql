select
    d.user_id,
    count(distinct d.activity_date) as active_days,
    sum(d.sessions) as total_sessions,
    sum(d.watch_minutes) as total_watch_minutes,
    {{ safe_divide('sum(d.watch_minutes)', 'nullif(sum(d.sessions),0)') }} as avg_watch_minutes_per_session
from {{ ref('fct_watch_activity_daily') }} d
group by 1
