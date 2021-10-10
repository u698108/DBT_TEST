{{ config(materialized='view',
   pre_hook=delta_detection(var('PROCESS_GROUP_NAME'),var('flag_2'))
   ) 
}}

select 1 as id