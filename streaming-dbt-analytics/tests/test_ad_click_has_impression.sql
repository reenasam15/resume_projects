select c.*
from {{ ref('stg_streaming__ad_clicks') }} c
left join {{ ref('stg_streaming__ad_impressions') }} i using (impression_id)
where i.impression_id is null
