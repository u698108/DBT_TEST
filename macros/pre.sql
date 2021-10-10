{% macro pre() %}

    {% set query %}
        INSERT INTO  MYTAB values('1');
    {% endset %}

    {% do run_query(query)%}

     {{ return("1" ) }}
{% endmacro %}