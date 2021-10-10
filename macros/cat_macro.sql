{% macro cat_macro() %}

{{log("{{ samplemacro() }} ",info=true)}}

{% endmacro %} 