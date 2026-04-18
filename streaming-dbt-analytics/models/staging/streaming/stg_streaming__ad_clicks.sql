select
    click_id,
    impression_id,
    cast(click_ts as timestamp) as click_ts,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'ad_clicks') }}
