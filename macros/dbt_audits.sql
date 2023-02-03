{% macro audit_log(run_activity) %}
insert into analytics_044.utilities.dbt_audit
values ('{{ invocation_id }}', '{{ this.name }}', '{{ run_activity }}', current_timestamp());

{% endmacro %}

{% macro audit_prep() %}
create table if not exists analytics_044.utilities.dbt_audit 
(
    run_id text,
    run_object text,
    run_activity text,
    created_at timestamp_ntz
);

{% endmacro %}