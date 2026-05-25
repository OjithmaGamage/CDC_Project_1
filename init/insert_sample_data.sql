-- Customers: 300
INSERT INTO crm.customers (customer_name, email, phone, city, country)
SELECT 
    'Customer ' || i,
    'customer' || i || '@example.com',
    '+94 77 ' || LPAD(i::text, 7, '0'),
    (ARRAY['Colombo','Kandy','Galle','Jaffna','Negombo'])[floor(random()*5)+1],
    'Sri Lanka'
FROM generate_series(1, 300) AS i;

-- Products: 50
INSERT INTO crm.products (product_name, category, price)
SELECT
    'Product ' || i,
    (ARRAY['Software','Hardware','Services','Training','Support'])[floor(random()*5)+1],
    ROUND((random() * 50000 + 1000)::numeric, 2)
FROM generate_series(1, 50) AS i;

-- Sales Reps: 20
INSERT INTO crm.sales_reps (sales_rep_name, region)
SELECT
    'Sales Rep ' || i,
    (ARRAY['Western','Central','Southern','Northern','Eastern'])[floor(random()*5)+1]
FROM generate_series(1, 20) AS i;

-- Opportunities: 300
INSERT INTO crm.opportunities (
    customer_id, sales_rep_id, opportunity_name, stage,
    expected_value, created_date, close_date
)
SELECT
    floor(random()*300 + 1)::int,
    floor(random()*20 + 1)::int,
    'Opportunity ' || i,
    (ARRAY['Prospecting','Proposal','Negotiation','Won','Lost'])[floor(random()*5)+1],
    ROUND((random() * 100000 + 5000)::numeric, 2),
    CURRENT_DATE - floor(random()*180)::int,
    CURRENT_DATE + floor(random()*90)::int
FROM generate_series(1, 300) AS i;

-- Orders: 300
INSERT INTO crm.orders (
    customer_id, sales_rep_id, order_date, order_status
)
SELECT
    floor(random()*300 + 1)::int,
    floor(random()*20 + 1)::int,
    CURRENT_DATE - floor(random()*365)::int,
    (ARRAY['Pending','Confirmed','Shipped','Completed','Cancelled'])[floor(random()*5)+1]
FROM generate_series(1, 300) AS i;

-- Order Items: around 1000
INSERT INTO crm.order_items (
    order_id, product_id, quantity, unit_price
)
SELECT
    floor(random()*300 + 1)::int,
    floor(random()*50 + 1)::int,
    floor(random()*10 + 1)::int,
    ROUND((random() * 50000 + 1000)::numeric, 2)
FROM generate_series(1, 1000) AS i;