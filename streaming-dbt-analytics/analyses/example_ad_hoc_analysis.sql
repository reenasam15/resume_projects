-- Example ad-hoc analysis for profile portfolio exploration
select
  u.country_code,
  count(distinct p.profile_id) as profiles,
  count(distinct u.user_id) as users,
  round(count(distinct p.profile_id) * 1.0 / nullif(count(distinct u.user_id),0), 2) as profiles_per_user
from {{ ref('dim_users') }} u
left join {{ ref('dim_profiles') }} p using (user_id)
group by 1
order by users desc;
