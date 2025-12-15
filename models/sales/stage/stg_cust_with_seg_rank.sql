{{ config(
    materialized="table",
    transient=false) 
}}

with stage_derived_cols as(
select 
customer_id, 
segment, 
decode(segment, 'Gold', 1, 'Silver', 2, 3) segment_wt
from {{ ref('raw_customers') }}
)
select * from stage_derived_cols 



