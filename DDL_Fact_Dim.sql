CREATE OR REPLACE TABLE dim_users AS (
  SELECT
    user_id
  FROM
    orders
);

CREATE OR REPLACE TABLE dim_products AS (
  SELECT
    product_id,
    product_name
  FROM
    products
);


CREATE OR REPLACE TABLE dim_aisles AS (
  SELECT
    aisle_id,
    aisle
  FROM
    aisles
);

CREATE OR REPLACE TABLE dim_departments AS (
  SELECT
    department_id,
    department
  FROM
    departments
);

CREATE OR REPLACE TABLE dim_orders AS (
  SELECT
    order_id,
    order_number,
    order_dow,
    order_hour_of_day,
    days_since_prior_order
  FROM
    orders
);

CREATE OR REPLACE TABLE fact_order_products AS (
  SELECT
    op.order_id,
    op.product_id,
    o.user_id,
    p.department_id,
    p.aisle_id,
    op.add_to_cart_order,
    op.reordered
  FROM
    order_products op
  JOIN
    orders o ON op.order_id = o.order_id
  JOIN
    products p ON op.product_id = p.product_id
);