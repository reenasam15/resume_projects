select
    profile_id,
    user_id,
    profile_name,
    cast(is_kids_profile as boolean) as is_kids_profile,
    cast(created_at as timestamp) as created_at,
    cast(updated_at as timestamp) as updated_at,
    {{ audit_columns() }}
from {{ source('raw_streaming', 'profiles') }}
