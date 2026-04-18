select
    impression_id,
    session_id,
    user_id,
    title_id,
    cast(impression_ts as timestamp) as impression_ts,
    lower(ad_network) as ad_network,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'ad_impressions') }}
