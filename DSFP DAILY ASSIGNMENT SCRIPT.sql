-- Daily assingment for Click on kaduna DSFP 5.0 Afternoon section class
-- Submitted by ONADERU HABEEBLAHI BOLUWATIFE 


-- Day 1 

-- Exercise 1: Database Creation
CREATE DATABASE test_db;
USE test_db;

-- Exercise 2: Basic SQL Syntax
CREATE TABLE sample_table (
    id INT,
    name VARCHAR(50)
);
SHOW TABLES;
DROP TABLE sample_table;

-- Exercise 3: Inserting and Querying Sample Data
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    major VARCHAR(100)
);

INSERT INTO students (student_id, first_name, last_name, age, major) VALUES
(1, 'John', 'Doe', 20, 'Computer Science'),
(2, 'Jane', 'Smith', 21, 'Mathematics'),
(3, 'Bob', 'Johnson', 22, 'Physics'),
(4, 'Alice', 'Williams', 19, 'Biology'),
(5, 'Bolu', 'Onaderu', 25,'chemistry'),
(6, 'Boss', 'Odanz', 40,'engineering math');

SELECT * FROM students;


-- Day 2 

-- Exercise 1: Database Schema and Table Creation
CREATE DATABASE school_db;
USE school_db;

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

SHOW TABLES;

-- Exercise 2: Modify table and Insert data
ALTER TABLE students ADD email VARCHAR(50);

-- Insert data into students table
INSERT INTO students (student_id, first_name, last_name, date_of_birth, email) VALUES
(1, 'ALice', 'Brown', '2000-01-15', 'alice@example.com'),
(2, 'Alice', 'Williams', '2001-09-17', 'awsss@gmail.com'),
(3, 'Bolu', 'Onaderu', '2001-05-21', 'fgfdddd@gmail.com'),
(5, 'Jane', 'Smith', '1999-05-20', 'jane.smith@email.com'),
(6, 'Bob', 'Johnson', '2001-03-10', 'bob.johnson@email.com');

-- Insert data into courses table
INSERT INTO courses (course_id, course_name, credit_hours) VALUES
(101, 'Mathematics', 3),
(102, 'Computer Science', 4),
(103, 'Physics', 3);

-- Insert data into enrollments table
INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-09-01'),
(2, 1, 102, '2023-09-01'),
(3, 2, 103, '2023-09-01'),
(4, 3, 101, '2023-09-01');


-- Day 3 

-- Exercise 1: Arithmetic and Comparison Operators
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 2500.00),
(2, 'Mouse', 2900.00),
(3, 'Keyboard', 7500.00),
(4, 'Monitor', 350.00),
(5, 'Tablet', 800.00);

-- Retrieve products with prices above 2000 and apply 8% discount
SELECT 
    product_name,
    price,
    price * 0.92 AS discount_price
FROM products
WHERE price > 2000;

-- Exercise 2: Sort & Filter Using ORDER BY and WHERE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees (employee_id, employee_name, department, hire_date) VALUES
(1, 'brian Doe', 'Sales', '2020-01-15'),
(2, 'boxtern Smith', 'Sales', '2021-03-20'),
(3, 'Boboson Johnson', 'IT', '2019-06-10'),
(4, 'Alim Winnie', 'Sales', '2022-08-05'),
(5, 'Charlie Brown', 'HR', '2020-11-30');

-- Query for employee_name, department and hire_date from "Sales" department
SELECT 
    employee_name,
    department,
    hire_date
FROM employees
WHERE department = 'Sales'
ORDER BY hire_date;


-- Day 4 
-- Exercise 1: Filtering Data with Logical Operators
CREATE TABLE employees_exercise (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    salary DECIMAL(10, 2),
    phone_number VARCHAR(20),
    state VARCHAR(50)
);

INSERT INTO employees_exercise (employee_id, name, email, salary, phone_number, state) VALUES
(1, 'John Doe', 'john@email.com', 55000.00, '123-456-7890', 'Kaduna'),
(2, 'Jane Smith', 'jane@email.com', 48000.00, '234-567-8901', 'Borno'),
(3, 'Bob Johnson', 'bob@email.com', 62000.00, '345-678-9012', 'Kaduna'),
(4, 'Alice Williams', 'alice@email.com', 51000.00, '456-789-0123', 'Ogun'),
(5, 'Charlie Brown', 'charlie@email.com', 53000.00, '567-890-1234', 'Lagos');

-- Retrieve name, email, phone_number and state where state is Kaduna or Lagos and salary > 50000
SELECT 
    name,
    email,
    phone_number,
    state
FROM employees_exercise
WHERE (state = 'Kaduna' OR state = 'Lagos')
  AND salary > 50000;

-- Exercise 2: Joining Tables
-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'John Smith', 'john@email.com'),
(2, 'Jane Doe', 'jane@email.com'),
(3, 'Bob Johnson', 'bob@email.com'),
(4, 'Alice Brown', 'alice@email.com');

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2023-10-01', 150.00),
(102, 1, '2023-10-05', 200.00),
(103, 2, '2023-10-02', 75.00),
(104, 3, '2023-10-03', 300.00);

-- INNER JOIN: Display all orders with customer names
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN: Show all customers with or without orders
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- Day 5 
-- Exercise 1: Group Data and Filter with HAVING

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(100),
    sale_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO sales (sale_id, salesperson, sale_date, amount) VALUES
(1, 'John Doe', '2023-10-01', 500.00),
(2, 'Jane Smith', '2023-10-01', 750.00),
(3, 'John Doe', '2023-10-02', 300.00),
(4, 'Bob Johnson', '2023-10-02', 1200.00),
(5, 'Jane Smith', '2023-10-03', 450.00),
(6, 'Bob Johnson', '2023-10-03', 800.00),
(7, 'John Doe', '2023-10-04', 600.00);

-- Calculate total sales per salesperson and show only those with sales > $1000
SELECT 
    salesperson,
    SUM(amount) AS total_sales
FROM sales
GROUP BY salesperson
HAVING SUM(amount) > 1000;

-- Exercise 2: Create a View

CREATE TABLE employees_dept (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees_dept (employee_id, employee_name, department, salary, hire_date) VALUES
(1, 'John Doe', 'Engineering', 75000.00, '2020-01-15'),
(2, 'Jane Smith', 'Sales', 65000.00, '2021-03-20'),
(3, 'Bob Johnson', 'Engineering', 80000.00, '2019-06-10'),
(4, 'Alice Williams', 'Engineering', 72000.00, '2022-08-05'),
(5, 'Charlie Brown', 'HR', 60000.00, '2020-11-30');

-- Create a view of employees in the Engineering department
CREATE VIEW engineering_employees AS
SELECT 
    employee_id,
    employee_name,
    department,
    salary,
    hire_date
FROM employees_dept
WHERE department = 'Engineering';

-- Query the view
SELECT * FROM engineering_employees;

-- Day 6 

-- Exercise 1: Design a Basic Logical Data Model for E-commerce
-- Create E-commerce database schema
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Customers table
CREATE TABLE customers_ecom (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products_ecom (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50),
    stock_quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders_ecom (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'Pending',
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers_ecom(customer_id)
);

-- Order_Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    subtotal DECIMAL(10, 2) AS (quantity * unit_price),
    FOREIGN KEY (order_id) REFERENCES orders_ecom(order_id),
    FOREIGN KEY (product_id) REFERENCES products_ecom(product_id)
);

-- Exercise 2: ETL Process for Loading Customer Data
-- Sample ETL steps 

-- Step 1: Create or download the CSV file to be imported import
-- Step 2: Load CSV through table import wizard (mySQl workbench)
-- Step 3: Transform and Load into new table



-- Day 7 

-- Exercise 1: Create Logical Schema for Inventory System
CREATE DATABASE inventory_db;
USE inventory_db;

-- Products table
CREATE TABLE inventory_products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_code VARCHAR(50) UNIQUE,
    description TEXT,
    category VARCHAR(50),
    unit_price DECIMAL(10, 2),
    cost_price DECIMAL(10, 2),
    quantity_in_stock INT DEFAULT 0,
    reorder_level INT DEFAULT 10,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Suppliers table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Orders table
CREATE TABLE inventory_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    order_date DATE,
    expected_delivery DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Order Details table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity_ordered INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES inventory_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES inventory_products(product_id)
);

-- Customers table for sales
CREATE TABLE inventory_customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Sales table
CREATE TABLE sales_transactions (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES inventory_customers(customer_id)
);

-- Sales Details table
CREATE TABLE sale_details (
    sale_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    product_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES sales_transactions(sale_id),
    FOREIGN KEY (product_id) REFERENCES inventory_products(product_id)
);

-- Add foreign key constraint to inventory_products
ALTER TABLE inventory_products 
ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);

-- Exercise 2: Import Data from CSV
-- Create a sample customers table
CREATE TABLE inventory_customers_sample (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Insert sample data (representing CSV data)
INSERT INTO inventory_customers_sample (customer_id, customer_name, email, phone, address, city, country) VALUES
(1, 'John Doe', 'john.doe@email.com', '123-456-7890', '123 Main St', 'New York', 'USA'),
(2, 'Jane Smith', 'jane.smith@email.com', '234-567-8901', '456 Oak Ave', 'Los Angeles', 'USA'),
(3, 'Bob Johnson', 'bob.johnson@email.com', '345-678-9012', '789 Pine Rd', 'Chicago', 'USA'),
(4, 'Alice Brown', 'alice.brown@email.com', '456-789-0123', '321 Elm St', 'Houston', 'USA');



-- Day 8 

USE inventory_db;
SHOW TABLES;

DESCRIBE inventory_products;
DESCRIBE suppliers;
DESCRIBE inventory_orders;

CREATE VIEW low_stock_products AS
SELECT 
    product_id,
    product_name,
    product_code,
    quantity_in_stock,
    reorder_level,
    (quantity_in_stock - reorder_level) AS stock_difference
FROM inventory_products
WHERE quantity_in_stock <= reorder_level;

-- query to show products that need reordering
SELECT * FROM low_stock_products;
