-- ========================================
-- MYSQL FUNCTIONS PRACTICE DATASET
-- ========================================

-- Create database
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- ========================================
-- TABLE 1: Employees
-- ========================================
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    birth_date DATE,
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    job_title VARCHAR(100)
);

INSERT INTO employees VALUES
(101, 'john', 'SMITH', 'john.smith@company.com', '+1-555-0101', '2020-03-15', '1990-05-20', 75000.00, 'Sales', 'Senior Sales Executive'),
(102, 'SARAH', 'johnson', 'sarah.j@company.com', '555.0102', '2019-07-22', '1988-11-30', 82000.50, 'IT', 'Software Developer'),
(103, 'Michael', 'Brown', 'mbrown@company.com', '(555) 0103', '2021-01-10', '1995-03-15', 65000.00, 'HR', 'HR Specialist'),
(104, 'emily', 'davis', 'emily.davis@company.com', '+1-555-0104', '2018-09-05', '1992-08-25', 90000.00, 'IT', 'Lead Developer'),
(105, 'DAVID', 'WILSON', 'dwilson@company.com', '555-0105', '2022-06-18', '1991-12-10', 55000.75, 'Sales', 'Sales Associate'),
(106, 'Jessica', 'Martinez', 'jmartinez@company.com', '+1-555-0106', '2020-11-30', '1994-02-28', 78000.00, 'Marketing', 'Marketing Manager'),
(107, 'robert', 'taylor', 'rtaylor@company.com', '555.0107', '2017-04-12', '1987-07-05', 95000.00, 'Finance', 'Financial Analyst');

-- ========================================
-- TABLE 2: Products
-- ========================================
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_restock_date DATETIME,
    expiry_date DATE,
    product_code VARCHAR(20)
);

INSERT INTO products VALUES
(1, '  Laptop Pro 15  ', 'Electronics', 1299.99, 45, '2024-11-15 14:30:00', '2026-11-15', 'ELEC-LAP-001'),
(2, 'Wireless Mouse', 'Electronics', 29.99, 150, '2024-10-20 09:15:00', NULL, 'ELEC-MOU-002'),
(3, 'Office Chair Deluxe', 'Furniture', 299.50, 30, '2024-09-05 11:00:00', NULL, 'FURN-CHR-003'),
(4, 'PROTEIN POWDER - Chocolate', 'Health', 49.99, 200, '2024-12-01 08:00:00', '2025-06-30', 'HLTH-PRO-004'),
(5, 'USB-C Cable (2m)', 'Electronics', 15.99, 500, '2024-11-25 16:45:00', NULL, 'ELEC-CBL-005'),
(6, 'Standing Desk', 'Furniture', 599.00, 12, '2024-08-18 10:30:00', NULL, 'FURN-DSK-006'),
(7, 'Vitamin D3 Supplements  ', 'Health', 19.99, 300, '2024-11-30 07:20:00', '2025-12-31', 'HLTH-VIT-007');

-- ========================================
-- TABLE 3: Orders
-- ========================================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME,
    delivery_date DATETIME,
    order_status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    notes TEXT
);

INSERT INTO orders VALUES
(5001, 'Alice Thompson', '2024-11-01 10:30:00', '2024-11-05 14:20:00', 'Delivered', 1500.00, 'Customer requested gift wrapping'),
(5002, 'Bob Anderson', '2024-11-15 14:45:00', NULL, 'Processing', 350.75, 'express shipping requested'),
(5003, 'Carol White', '2024-10-20 09:15:00', '2024-10-25 16:30:00', 'Delivered', 899.99, 'Left at front door as per instructions'),
(5004, 'Daniel Lee', '2024-12-01 08:00:00', NULL, 'Pending', 2100.50, NULL),
(5005, 'Emma Garcia', '2024-11-28 16:20:00', '2024-12-02 11:10:00', 'Delivered', 125.00, 'customer very satisfied'),
(5006, 'Frank Miller', '2024-09-10 12:00:00', '2024-09-18 10:45:00', 'Delivered', 450.00, 'Second-time customer'),
(5007, 'Grace Davis', '2024-12-05 11:30:00', NULL, 'Processing', 780.25, 'URGENT - needed by Dec 10');

