CREATE SCHEMA crm;

CREATE TABLE crm.customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE crm.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE crm.sales_reps (
    sales_rep_id SERIAL PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE crm.opportunities (
    opportunity_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES crm.customers(customer_id),
    sales_rep_id INT REFERENCES crm.sales_reps(sales_rep_id),
    opportunity_name VARCHAR(100),
    stage VARCHAR(50),
    expected_value NUMERIC(12,2),
    created_date DATE,
    close_date DATE
);

CREATE TABLE crm.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES crm.customers(customer_id),
    sales_rep_id INT REFERENCES crm.sales_reps(sales_rep_id),
    order_date DATE,
    order_status VARCHAR(50)
);

CREATE TABLE crm.order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES crm.orders(order_id),
    product_id INT REFERENCES crm.products(product_id),
    quantity INT,
    unit_price NUMERIC(10,2)
);