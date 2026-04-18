select
    t.title_id,
    dt.title_name,
    sum(t.sessions) as total_sessions,
    sum(t.total_watch_minutes) as total_watch_minutes,
    sum(t.completed_sessions) as completed_sessions,
    {{ safe_divide('sum(t.completed_sessions)', 'sum(t.sessions)') }} as completion_rate
from {{ ref('int_title_daily_engagement') }} t
left join {{ ref('dim_titles') }} dt using (title_id)
group by 1,2
