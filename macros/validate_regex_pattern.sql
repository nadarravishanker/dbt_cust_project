{% test validate_regex_pattern(model, column_name, pattern) %}

select * from {{model}}
where not regexp_like({{column_name}}, '{{pattern}}')
    
{% endtest %}