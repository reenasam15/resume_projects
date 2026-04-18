select
    u.user_id,
    u.email,
    u.country_code,
    crm.region,
    u.account_status,
    u.signup_at,
    u.updated_at
from {{ ref('stg_streaming__users') }} u
left join {{ ref('country_region_mapping') }} crm on u.country_code = crm.country_code
