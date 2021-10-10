{% macro samplemacro(param1) %}

    {% set query %}
        INSERT INTO  MYTAB values({param1});
    {% endset %}

    {% do run_query(query)%}

     
{% endmacro %}