
{% macro some_macro() %}
    {%set NANO =0%}

    {{ log("Running some_macro: " ~ NANO ,info=true ) }}

    {%set query%}
        SELECT * FROM FACT_CUSTOMER;
    {%endset%}

    {%set result= run_query(query)%}
         {% set result1 = result.rows[1]  %}
         {{ log(result1 ,info=true ) }}
    
    {%set name="SHANTANU"%}

    {{ log("\n" ,info=true ) }}
    {{ log("BELOW ARE STRING OPERATIONS" ,info=true ) }}
    {{ log(name[0:5] ,info=true ) }}
    {{ log(name|reverse ,info=true ) }}
    {{ log("\n" ,info=true ) }}
    {%set navigation=range(0,5) %}
    {% for item in navigation %}
        {{ log(item ,info=true ) }}
    {% endfor %}

{% set host_ip = range(0,5) %}
{% set server_ip = [] %}
{% for ip in host_ip  %}
{{ server_ip.append( ip ) }}
{% endfor %}
{{ log(server_ip ,info=true ) }}


{%for i in server_ip%}
{{ log(i ,info=true ) }}
{%endfor%}
{% endmacro %}
