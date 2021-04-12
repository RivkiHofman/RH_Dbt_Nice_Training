select customer_id
from {{ ref('dim_customers') }}
where nvl(lifetime_value,0) = 0
and number_of_orders > 0 