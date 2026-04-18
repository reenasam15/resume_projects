{{ config(materialized='incremental', unique_key='event_id', incremental_strategy='delete+insert') }}

select
    event_id,
    session_id,
    lower(event_type) as event_type,
    cast(event_ts as timestamp) as event_ts,
    cast(position_seconds as integer) as position_seconds,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'playback_events') }}
{% if is_incremental() %}
where cast(updated_at as timestamp) >= (select coalesce(max(updated_at), '1900-01-01'::timestamp) from {{ this }})
{% endif %}
qualify row_number() over (partition by event_id order by cast(updated_at as timestamp) desc) = 1
