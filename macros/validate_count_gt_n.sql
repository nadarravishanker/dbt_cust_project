{% test validate_count_gt_n(model, column_name, value) %}

select * from
{{model}}
where {{column_name}} <= {{value}}
    
{% endtest %}