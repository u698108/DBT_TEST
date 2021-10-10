{%  macro delta_detection(table_name,flag)  %}

    {% set delta_detection_ids  = []  %}
    {% set table_names  = []  %}

    {%  if flag == 0  %}

        {%  set query_1   %}

            select id,table_name from {{table_name}} where id%3=1;

        {%  endset   %}

        {% set result = run_query(query_1)    %}

        {%  if execute   %}

            {%  set delta_detection_id_length = result.columns[0].values() | length  %}

            {%  for i in range(0,delta_detection_id_length)    %}

                {% set table_name = result.columns[1].values()[i]    %}
                {% set delta_detection_id = result.columns[0].values()[i]    %}

                {%  do table_names.append(table_name) %}
                {%  do delta_detection_ids.append(delta_detection_id)   %}

            {%  endfor  %}


            {{log(table_names,info=True)}}
            {{log(delta_detection_ids,info=True)}}

            {%  for i in range(0,delta_detection_id_length)    %}

                {%  set query_2  %}

                    insert into {{table_names[i]}} values ('sample');
                
                {% endset  %}

                {%  set query_3 %}

                    update delta_status set status='SUCCESS' where id={{delta_detection_ids[i]}};
                
                {%  endset  %}

                {%  do run_query(query_2)  %}
                {%  do run_query(query_3)  %}

            {% endfor  %}

        {%  endif  %}

    {%  endif  %}

    {%  if flag == 1 %}

        {%  set query_1   %}

            select id,table_name from {{table_name}} where id%3=2;

        {%  endset   %}

        {% set result = run_query(query_1)    %}

        {%  if execute   %}

            {%  set delta_detection_id_length = result.columns[0].values() | length  %}

            {%  for i in range(0,delta_detection_id_length)    %}

                {% set table_name = result.columns[1].values()[i]    %}
                {% set delta_detection_id = result.columns[0].values()[i]    %}

                {%  do table_names.append(table_name) %}
                {%  do delta_detection_ids.append(delta_detection_id)   %}

            {%  endfor  %}


            {{log(table_names,info=True)}}
            {{log(delta_detection_ids,info=True)}}

            {%  for i in range(0,delta_detection_id_length)    %}

                {%  set query_2  %}

                    insert into {{table_names[i]}} values ('sample');

                {% endset  %}

                {%  set query_3 %}

                    update delta_status set status='SUCCESS' where id={{delta_detection_ids[i]}};
                
                {%  endset  %}

                {%  do run_query(query_2)  %}
                {%  do run_query(query_3)  %}

            {% endfor  %}

        {%  endif  %}

    {%  endif  %}
    {%  if flag == 2 %}

        {%  set query_1   %}

            select id,table_name from {{table_name}} where id%3=0;

        {%  endset   %}

        {% set result = run_query(query_1)    %}

        {%  if execute   %}

            {%  set delta_detection_id_length = result.columns[0].values() | length  %}

            {%  for i in range(0,delta_detection_id_length)    %}

                {% set table_name = result.columns[1].values()[i]    %}
                {% set delta_detection_id = result.columns[0].values()[i]    %}

                {%  do table_names.append(table_name) %}
                {%  do delta_detection_ids.append(delta_detection_id)   %}

            {%  endfor  %}


            {{log(table_names,info=True)}}
            {{log(delta_detection_ids,info=True)}}

            {%  for i in range(0,delta_detection_id_length)    %}

                {%  set query_2  %}

                    insert into {{table_names[i]}} values ('sample');

                {% endset  %}

                {%  set query_3 %}

                    update delta_status set status='SUCCESS' where id={{delta_detection_ids[i]}};
                
                {%  endset  %}

                {%  do run_query(query_2)  %}
                {%  do run_query(query_3)  %}

            {% endfor  %}

        {%  endif  %}

    {%  endif  %}
{%  endmacro  %}