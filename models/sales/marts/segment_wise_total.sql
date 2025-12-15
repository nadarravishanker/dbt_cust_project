-- Override default setting in dbt_project.yml
{{
    config(
        materialized='table',   
        transient=false
    )
}}

with segment_rank as
(

    select customer_id, segment, segment_wt
    from {{ ref('stg_cust_with_seg_rank') }}
),
mart_segment_wise_cust_count as
(
select segment, segment_wt, count(*) total
from segment_rank
group by segment, segment_wt
)
select segment, total
from mart_segment_wise_cust_count
order by segment_wt
