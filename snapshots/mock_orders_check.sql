{% snapshot mock_orders_check %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='analytics',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='check',
      check_cols=['status'],
    )
}}

select order_id,status from analytics.{{target.schema}}.mock_orders

{% endsnapshot %}