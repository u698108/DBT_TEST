{%macro xml_delete()%}
    {%set query%} 
    SELECT TBL_NME FROM meta;
    {%endset%}
    {%set query1%}
    SELECT COUNT(*) AS CNT FROM meta;
    {%endset%}
    {% set tbl_name= run_query(query)%}
    {% set cnt= run_query(query1)%}
    {% set cnt1= cnt.columns[0].values()[0]%}
       {{log(cnt1,info=true)}}

    {% set q_list=[] %}
    {%for i in range (0,cnt1|int)%}
        {%set q_table="BEGIN; DELETE FROM " + tbl_name.columns[0].values()[i]+"; COMMIT;" %}
        
        {%do run_query(q_table)%}
    {%endfor%}
    
    --{%for i in range (0,cnt1|int)%}
    --   
    --{%endfor%}
 {% endmacro %}