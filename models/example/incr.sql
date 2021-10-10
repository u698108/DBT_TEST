{{
    config(
        materialized='incremental')
}}

SELECT * FROM STG_CUSTOMER_DEPT
{% if is_incremental() %}
 where id >= (select max(id) from {{ this }})

 {% endif %}