select
    trim(title_id) as title_id,
    initcap(trim(genre)) as genre,
    {{ generate_surrogate_key(['trim(title_id)', 'initcap(trim(genre))']) }} as title_genre_sk
from {{ source('raw_streaming', 'title_genres') }}
