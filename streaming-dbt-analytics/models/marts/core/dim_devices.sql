select
    d.device_id,
    d.user_id,
    d.device_type,
    m.device_category,
    d.os_name,
    d.country_code,
    d.first_seen_at,
    d.last_seen_at
from {{ ref('stg_streaming__devices') }} d
left join {{ ref('device_category_mapping') }} m on d.device_type = m.device_type_raw
