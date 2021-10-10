
{% macro some() %}

  {%set query%}
        
        call test_proc();
    {%endset%}

    {%set cnt= run_query(query)%}
{{log(cnt.columns[0].values(),info=true)}}
{% endmacro %}
