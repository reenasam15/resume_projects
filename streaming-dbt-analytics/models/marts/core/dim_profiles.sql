select
    p.profile_id,
    p.user_id,
    p.profile_name,
    p.is_kids_profile,
    p.created_at
from {{ ref('stg_streaming__profiles') }} p
