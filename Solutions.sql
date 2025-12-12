-- ========================================
-- MYSQL FUNCTIONS PRACTICE - SOLUTIONS
-- ========================================

USE practice_db;

-- ========================================
-- STRING FUNCTIONS SOLUTIONS (1-15)
-- ========================================

-- 1. Convert all first names to uppercase and last names to lowercase
SELECT 
    employee_id,
    UPPER(first_name) AS first_name_upper,
    LOWER(last_name) AS last_name_lower
FROM employees;

-- 2. Extract domain name from email addresses
SELECT 
    employee_id,
    email,
    SUBSTRING(email, LOCATE('@', email) + 1) AS domain_name
FROM employees;

-- 3. Find length of product names and show products with names > 15 characters
SELECT 
    product_id,
    product_name,
    LENGTH(TRIM(product_name)) AS name_length
FROM products
WHERE LENGTH(TRIM(product_name)) > 15;

-- 4. Concatenate first_name and last_name with Title Case
SELECT 
    employee_id,
    CONCAT(
        UPPER(LEFT(first_name, 1)),
        LOWER(SUBSTRING(first_name, 2)),
        ' ',
        UPPER(LEFT(last_name, 1)),
        LOWER(SUBSTRING(last_name, 2))
    ) AS full_name_title_case
FROM employees;

-- 5. Replace all hyphens in phone numbers with dots
SELECT 
    employee_id,
    phone_number,
    REPLACE(phone_number, '-', '.') AS phone_with_dots
FROM employees;

-- 6. Trim leading and trailing spaces from product names
SELECT 
    product_id,
    product_name AS original_name,
    TRIM(product_name) AS trimmed_name,
    LENGTH(product_name) AS original_length,
    LENGTH(TRIM(product_name)) AS trimmed_length
FROM products;

-- 7. Extract first 3 characters from department names
SELECT 
    DISTINCT department,
    LEFT(department, 3) AS dept_code
FROM employees;

-- 8. Find employees whose email contains 'company.com' (case-insensitive)
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email
FROM employees
WHERE LOWER(email) LIKE '%company.com%';

-- 9. Get position of '@' symbol in email addresses
SELECT 
    employee_id,
    email,
    LOCATE('@', email) AS at_position,
    INSTR(email, '@') AS at_position_instr
FROM employees;

-- 10. Reverse the product codes
SELECT 
    product_id,
    product_code,
    REVERSE(product_code) AS reversed_code
FROM products;

-- 11. Extract category prefix from product codes (text before first hyphen)
SELECT 
    product_id,
    product_code,
    SUBSTRING(product_code, 1, LOCATE('-', product_code) - 1) AS category_prefix
FROM products;

-- 12. Pad employee IDs with zeros on left to make them 6 digits
SELECT 
    employee_id,
    LPAD(employee_id, 6, '0') AS padded_id
FROM employees;

-- 13. Count number of words in notes column
SELECT 
    order_id,
    notes,
    CASE 
        WHEN notes IS NULL THEN 0
        ELSE LENGTH(notes) - LENGTH(REPLACE(notes, ' ', '')) + 1
    END AS word_count
FROM orders;

-- 14. Replace 'Electronics' with 'Tech' in product categories
SELECT 
    product_id,
    product_name,
    category AS original_category,
    REPLACE(category, 'Electronics', 'Tech') AS updated_category
FROM products;

-- 15. Find customers whose names start with a vowel
SELECT 
    order_id,
    customer_name
FROM orders
WHERE LEFT(UPPER(customer_name), 1) IN ('A', 'E', 'I', 'O', 'U');

-- ========================================
-- DATETIME FUNCTIONS SOLUTIONS (16-30)
-- ========================================

-- 16. Calculate age of each employee in years
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    birth_date,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age_years
FROM employees;

-- 17. Find employees hired in last 3 years
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_since_hired
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

-- 18. Calculate how many days each employee has been with company
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_with_company
FROM employees
ORDER BY days_with_company DESC;

-- 19. Extract year, month, and day separately from hire_date
SELECT 
    employee_id,
    hire_date,
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    DAY(hire_date) AS hire_day,
    MONTHNAME(hire_date) AS hire_month_name
FROM employees;

-- 20. Find all products that will expire within next 6 months
SELECT 
    product_id,
    product_name,
    expiry_date,
    DATEDIFF(expiry_date, CURDATE()) AS days_until_expiry
FROM products
WHERE expiry_date IS NOT NULL
    AND expiry_date <= DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
    AND expiry_date >= CURDATE();

-- 21. Calculate day of week when each employee was hired
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date,
    DAYNAME(hire_date) AS hire_day_of_week,
    DAYOFWEEK(hire_date) AS day_number
FROM employees;

-- 22. Find difference in days between order_date and delivery_date
SELECT 
    order_id,
    customer_name,
    order_date,
    delivery_date,
    DATEDIFF(delivery_date, order_date) AS delivery_time_days,
    TIMESTAMPDIFF(HOUR, order_date, delivery_date) AS delivery_time_hours
FROM orders
WHERE delivery_date IS NOT NULL;

-- 23. Add 90 days to last_restock_date for next expected restock
SELECT 
    product_id,
    product_name,
    last_restock_date,
    DATE_ADD(last_restock_date, INTERVAL 90 DAY) AS next_restock_date
FROM products;

-- 24. Find orders placed in November
SELECT 
    order_id,
    customer_name,
    order_date,
    MONTHNAME(order_date) AS order_month
FROM orders
WHERE MONTH(order_date) = 11;

-- 25. Calculate quarter in which each employee was hired
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date,
    QUARTER(hire_date) AS hire_quarter,
    CONCAT('Q', QUARTER(hire_date), ' ', YEAR(hire_date)) AS quarter_year
FROM employees;

-- 26. Find employees whose birthday is in current month
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    birth_date,
    MONTHNAME(birth_date) AS birth_month
FROM employees
WHERE MONTH(birth_date) = MONTH(CURDATE());

-- 27. Format hire_date as 'DD-Mon-YYYY'
SELECT 
    employee_id,
    hire_date,
    DATE_FORMAT(hire_date, '%d-%b-%Y') AS formatted_date
FROM employees;

-- 28. Calculate complete months since last restock
SELECT 
    product_id,
    product_name,
    last_restock_date,
    TIMESTAMPDIFF(MONTH, last_restock_date, NOW()) AS months_since_restock
FROM products;

-- 29. Find last day of month for each order date
SELECT 
    order_id,
    order_date,
    LAST_DAY(order_date) AS last_day_of_month
FROM orders;

-- 30. Get week number of year for each order date
SELECT 
    order_id,
    order_date,
    WEEK(order_date) AS week_number,
    WEEKOFYEAR(order_date) AS week_of_year
FROM orders;

-- ========================================
-- MISCELLANEOUS FUNCTIONS SOLUTIONS (31-45)
-- ========================================

-- 31. Rank employees by salary within their department
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 32. Calculate 10% bonus and round to 2 decimal places
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    ROUND(salary * 0.10, 2) AS bonus_10_percent,
    ROUND(salary + (salary * 0.10), 2) AS total_with_bonus
FROM employees;

-- 33. Categorize salaries using CASE
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    CASE 
        WHEN salary < 60000 THEN 'Entry Level'
        WHEN salary BETWEEN 60000 AND 80000 THEN 'Mid Level'
        ELSE 'Senior Level'
    END AS salary_category
FROM employees;

-- 34. Find second highest salary in each department
SELECT 
    department,
    salary AS second_highest_salary
FROM (
    SELECT 
        department,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees
) AS ranked
WHERE salary_rank = 2;

-- 35. Generate random discount between 5% and 15%
SELECT 
    product_id,
    product_name,
    price,
    ROUND(5 + (RAND() * 10), 2) AS random_discount_percent,
    ROUND(price * (1 - (5 + (RAND() * 10)) / 100), 2) AS discounted_price
FROM products;

-- 36. Use COALESCE to replace NULL delivery_dates
SELECT 
    order_id,
    customer_name,
    order_date,
    COALESCE(DATE_FORMAT(delivery_date, '%Y-%m-%d %H:%i'), 'Not Yet Delivered') AS delivery_status
FROM orders;

-- 37. Calculate cumulative sum of order amounts
SELECT 
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS cumulative_total
FROM orders;

-- 38. Use NULLIF to return NULL if stock is 0
SELECT 
    product_id,
    product_name,
    stock_quantity,
    NULLIF(stock_quantity, 0) AS stock_or_null
FROM products;

-- 39. Find employees with salary above average
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    (SELECT ROUND(AVG(salary), 2) FROM employees) AS avg_salary,
    ROUND(salary - (SELECT AVG(salary) FROM employees), 2) AS above_average_by
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 40. Use IF function to mark stock status
SELECT 
    product_id,
    product_name,
    stock_quantity,
    IF(stock_quantity > 50, 'In Stock', 'Low Stock') AS stock_status
FROM products;

-- 41. Calculate percentage of total sales each order represents
SELECT 
    order_id,
    customer_name,
    total_amount,
    ROUND((total_amount / (SELECT SUM(total_amount) FROM orders)) * 100, 2) AS percentage_of_total
FROM orders;

-- 42. Use GREATEST for bonus calculation
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    ROUND(salary * 0.1, 2) AS ten_percent,
    GREATEST(ROUND(salary * 0.1, 2), 5000) AS actual_bonus
FROM employees;

-- 43. Convert salary to EUR (exchange rate 1.2)
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary AS salary_usd,
    ROUND(salary * 1.2, 2) AS salary_eur,
    CONCAT('$', FORMAT(salary, 2)) AS formatted_usd,
    CONCAT('€', FORMAT(salary * 1.2, 2)) AS formatted_eur
FROM employees;

-- 44. Use ROW_NUMBER to assign sequential numbers
SELECT 
    ROW_NUMBER() OVER (ORDER BY hire_date) AS sequence_number,
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    hire_date
FROM employees;

-- 45. Find products within average price range (±100)
SELECT 
    product_id,
    product_name,
    price,
    ROUND((SELECT AVG(price) FROM products), 2) AS avg_price
FROM products
WHERE price BETWEEN 
    (SELECT AVG(price) - 100 FROM products) 
    AND 
    (SELECT AVG(price) + 100 FROM products);

-- ========================================
-- BONUS: COMBINED CHALLENGES (46-50)
-- ========================================

-- 46. Create full email signature
SELECT 
    employee_id,
    CONCAT(
        UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2)),
        ' ',
        UPPER(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2)),
        ' <', email, '> | Dept: ', UPPER(department),
        ' | Hired: ', DATE_FORMAT(hire_date, '%a %d, %Y')
    ) AS email_signature
FROM employees;

-- 47. Employees hired >2 years ago with 5-letter names
SELECT 
    employee_id,
    first_name,
    last_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) / 365 AS years_with_company
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 730
    AND (LENGTH(TRIM(first_name)) = 5 OR LENGTH(TRIM(last_name)) = 5);

-- 48. Categorize delivery time for delivered orders
SELECT 
    order_id,
    customer_name,
    order_date,
    delivery_date,
    TIMESTAMPDIFF(HOUR, order_date, delivery_date) AS delivery_hours,
    CASE 
        WHEN TIMESTAMPDIFF(HOUR, order_date, delivery_date) < 24 THEN 'Express'
        WHEN TIMESTAMPDIFF(HOUR, order_date, delivery_date) BETWEEN 24 AND 72 THEN 'Standard'
        ELSE 'Delayed'
    END AS delivery_category
FROM orders
WHERE delivery_date IS NOT NULL;

-- 49. Create comprehensive product report
SELECT 
    product_id,
    UPPER(category) AS category_upper,
    TRIM(product_name) AS product_name_clean,
    CASE 
        WHEN expiry_date IS NULL THEN 'No Expiry'
        ELSE CONCAT(DATEDIFF(expiry_date, CURDATE()), ' days')
    END AS days_until_expiry,
    CONCAT('$', FORMAT(price, 2)) AS formatted_price
FROM products;

-- 50. Generate performance score
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_of_service,
    salary,
    (TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) * 10) + 
    (CASE 
        WHEN salary > 80000 THEN 20
        WHEN salary > 60000 THEN 10
        ELSE 5
    END) AS performance_score
FROM employees
ORDER BY performance_score DESC;

-- ========================================
-- BONUS: ADDITIONAL ADVANCED QUERIES
-- ========================================

-- Complex query combining multiple functions
SELECT 
    e.employee_id,
    CONCAT(UPPER(LEFT(e.first_name, 1)), LOWER(SUBSTRING(e.first_name, 2)), ' ', 
           UPPER(LEFT(e.last_name, 1)), LOWER(SUBSTRING(e.last_name, 2))) AS full_name,
    e.department,
    CONCAT('$', FORMAT(e.salary, 2)) AS formatted_salary,
    TIMESTAMPDIFF(YEAR, e.birth_date, CURDATE()) AS age,
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS years_employed,
    DATE_FORMAT(e.hire_date, '%W, %M %d, %Y') AS hire_date_formatted,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) >= 5 THEN 'Veteran'
        WHEN TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) >= 2 THEN 'Experienced'
        ELSE 'New'
    END AS employee_status,
    RANK() OVER (PARTITION BY e.department ORDER BY e.salary DESC) AS dept_salary_rank
FROM employees e
ORDER BY e.department, dept_salary_rank;