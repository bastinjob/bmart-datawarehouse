-- Create the database
CREATE DATABASE warehouse;

-- Connect to the database
\c warehouse;

-- Create dimension tables
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE dates (
    date_id SERIAL PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),
    region VARCHAR(50)
);

-- Create fact table
CREATE TABLE sales (
    sales_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    date_id INT REFERENCES dates(date_id),
    store_id INT REFERENCES stores(store_id),
    sales_amount DECIMAL(10, 2)
);

-- Insert data into dimension tables
INSERT INTO products (product_name, category) VALUES
('Product A', 'Category 1'),
('Product B', 'Category 1'),
('Product C', 'Category 2'),
('Product D', 'Category 2'),
('Product E', 'Category 3');

INSERT INTO customers (customer_name, location) VALUES
('Customer 1', 'Location 1'),
('Customer 2', 'Location 2'),
('Customer 3', 'Location 3'),
('Customer 4', 'Location 4'),
('Customer 5', 'Location 5');

INSERT INTO dates (date, year, month, day) VALUES
('2023-01-01', 2023, 1, 1),
('2023-01-02', 2023, 1, 2),
('2023-01-03', 2023, 1, 3),
('2023-01-04', 2023, 1, 4),
('2023-01-05', 2023, 1, 5),
('2023-01-06', 2023, 1, 6),
('2023-01-07', 2023, 1, 7),
('2023-01-08', 2023, 1, 8),
('2023-01-09', 2023, 1, 9),
('2023-01-10', 2023, 1, 10);

INSERT INTO stores (store_name, region) VALUES
('Store 1', 'Region 1'),
('Store 2', 'Region 2'),
('Store 3', 'Region 3'),
('Store 4', 'Region 4'),
('Store 5', 'Region 5');

-- Populate fact table
DO $$
DECLARE
    i INT := 1;
    product_count INT;
    customer_count INT;
    date_count INT;
    store_count INT;
BEGIN
    SELECT COUNT(*) INTO product_count FROM products;
    SELECT COUNT(*) INTO customer_count FROM customers;
    SELECT COUNT(*) INTO date_count FROM dates;
    SELECT COUNT(*) INTO store_count FROM stores;

    WHILE i <= 100 LOOP
        INSERT INTO sales (product_id, customer_id, date_id, store_id, sales_amount) VALUES
        (
            (i % product_count) + 1,
            (i % customer_count) + 1,
            (i % date_count) + 1,
            (i % store_count) + 1,
            ROUND(RANDOM() * 1000, 2)
        );
        i := i + 1;
    END LOOP;
END $$;
