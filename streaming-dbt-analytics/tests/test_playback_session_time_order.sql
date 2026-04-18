select *
from {{ ref('stg_streaming__playback_sessions') }}
where session_end_at < session_start_at
