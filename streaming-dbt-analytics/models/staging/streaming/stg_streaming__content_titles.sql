select
    title_id,
    title_name,
    lower(content_type) as content_type,
    cast(release_year as integer) as release_year,
    cast(runtime_minutes as integer) as runtime_minutes,
    maturity_rating,
    cast(is_active as boolean) as is_active,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'content_titles') }}
