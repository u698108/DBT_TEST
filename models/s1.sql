{{ config(materialized='view',
   pre_hook=delta_detection(var('PROCESS_GROUP_NAME'),var('flag_1'))
   ) 
}}

select 1 as id