select
    s.session_id,
    s.user_id,
    s.profile_id,
    s.device_id,
    s.title_id,
    s.session_start_at,
    s.session_end_at,
    datediff('minute', s.session_start_at, s.session_end_at) as session_minutes,
    count(e.event_id) as event_count,
    max(case when e.event_type = 'complete' then 1 else 0 end) as completed_flag
from {{ ref('stg_streaming__playback_sessions') }} s
left join {{ ref('stg_streaming__playback_events') }} e using (session_id)
group by 1,2,3,4,5,6,7
