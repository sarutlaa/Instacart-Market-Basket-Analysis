-- CREATED A STAGING AREA TO ACCESS THE AWS S3 BUCKET AUTHENTICATING AWS USING SNOWFLAKE
CREATE STAGE my_stage
URL = 's3://dw-snowflake-course-sravya/instacart/'
CREDENTIALS = (AWS_KEY_ID = '........' AWS_SECRET_KEY = '........');

-- TELLING SNOWFLAKE WHICH TYPE OF FILES WE ARE WORKING WITH IN S3
CREATE OR REPLACE FILE FORMAT csv_file_format
TYPE = 'CSV'
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

CREATE TABLE AISLES (
aisle_id INTEGER PRIMARY KEY,
aisle VARCHAR
);

COPY INTO aisles (aisle_id, aisle)
FROM @my_stage/aisles.csv
FILE_FORMAT = (FORMAT_NAME = 'csv_file_format');


CREATE OR REPLACE TABLE departments (
department_id INTEGER PRIMARY KEY,
department VARCHAR
);

COPY INTO departments (department_id, department)
FROM @my_stage/departments.csv
FILE_FORMAT = (FORMAT_NAME = 'csv_file_format');

CREATE OR REPLACE TABLE products (
product_id INTEGER PRIMARY KEY,
product_name VARCHAR,
aisle_id INTEGER,
department_id INTEGER
);

COPY INTO products (product_id, product_name,aisle_id,department_id)
FROM @my_stage/products.csv
FILE_FORMAT = (FORMAT_NAME = 'csv_file_format');

CREATE OR REPLACE TABLE orders (
order_id INTEGER PRIMARY KEY,
user_id INTEGER,
eval_set STRING,
order_number INTEGER,
order_dow INTEGER,
order_hour_of_day INTEGER,
days_since_prior_order INTEGER
);

COPY INTO orders (order_id,user_id,eval_set,order_number,order_dow,order_hour_of_day,days_since_prior_order)
FROM @my_stage/orders.csv
FILE_FORMAT = (FORMAT_NAME = 'csv_file_format');

CREATE OR REPLACE TABLE order_products (
order_id INTEGER,
product_id INTEGER,
add_to_cart_order STRING,
reordered INTEGER,
PRIMARY KEY (order_id, product_id)
);

COPY INTO order_products (order_id,product_id,add_to_cart_order,reordered)
FROM @my_stage/order_products__prior.csv
FILE_FORMAT = (FORMAT_NAME = 'csv_file_format');

select * from order_products_prior
drop table order_products_prior



