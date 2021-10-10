{% macro post() %}

    {% set query %}
        INSERT INTO  MYTAB values('2');
    {% endset %}

    {% do run_query(query)%}
{% endmacro %}