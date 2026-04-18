with imp as (
    select date_trunc('day', impression_ts) as activity_date, impression_id, ad_network
    from {{ ref('stg_streaming__ad_impressions') }}
), clk as (
    select impression_id, click_id
    from {{ ref('stg_streaming__ad_clicks') }}
)
select
    i.activity_date,
    i.ad_network,
    count(distinct i.impression_id) as impressions,
    count(distinct c.click_id) as clicks,
    {{ safe_divide('count(distinct c.click_id)', 'count(distinct i.impression_id)') }} as ctr
from imp i
left join clk c using (impression_id)
group by 1,2
