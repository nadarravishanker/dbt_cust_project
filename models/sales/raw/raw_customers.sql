{{ config(
    materialized='table', 
    transient=false) 
}}

with source as(
    select customer_id, 
    segment 
from {{ source('cust_src', 'customers') }}
)
select customer_id, 
segment, 
from source

