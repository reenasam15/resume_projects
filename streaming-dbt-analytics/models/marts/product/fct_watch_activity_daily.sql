{{ config(materialized='incremental', unique_key=['activity_date','user_id'], incremental_strategy='delete+insert') }}

select
    activity_date,
    user_id,
    sessions,
    watch_minutes
from {{ ref('int_daily_user_activity') }}
{% if is_incremental() %}
where activity_date >= (select coalesce(max(activity_date), '1900-01-01'::date) from {{ this }})
{% endif %}
