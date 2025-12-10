{{ config(
    materialized="table",
    transient=false) 
}}

with transform as(
select 
customer_id, 
segment, 
decode(segment, 'Gold', 1, 'Silver', 2, 3) segment_wt
from {{ ref('raw_customers') }}
)
select * from transform 



