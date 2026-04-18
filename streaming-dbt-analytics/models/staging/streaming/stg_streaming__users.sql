with ranked as (
    select
        trim(user_id) as user_id,
        lower(trim(email)) as email,
        upper(trim(country_code)) as country_code,
        lower(trim(account_status)) as account_status,
        cast(signup_at as timestamp) as signup_at,
        cast(updated_at as timestamp) as updated_at,
        row_number() over (partition by trim(user_id) order by cast(updated_at as timestamp) desc) as rn
    from {{ source('raw_streaming', 'users') }}
)
select
    user_id,
    email,
    coalesce(country_code, 'UNKNOWN') as country_code,
    case when account_status in ('active','paused','cancelled','suspended') then account_status else 'unknown' end as account_status,
    signup_at,
    updated_at,
    {{ audit_columns() }}
from ranked
where rn = 1
