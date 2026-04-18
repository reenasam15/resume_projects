with genres as (
    select title_id, string_agg(genre, ', ') as genres
    from {{ ref('stg_streaming__title_genres') }}
    group by 1
)
select
    t.title_id,
    t.title_name,
    t.content_type,
    t.release_year,
    t.runtime_minutes,
    t.maturity_rating,
    t.is_active,
    g.genres
from {{ ref('stg_streaming__content_titles') }} t
left join genres g using (title_id)
