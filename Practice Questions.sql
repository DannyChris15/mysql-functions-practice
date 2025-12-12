-- ========================================
-- PRACTICE QUESTIONS
-- ========================================

-- STRING FUNCTIONS (15 Questions)
-- ----------------------------------------
-- 1. Convert all first names to uppercase and last names to lowercase in employees table
-- 2. Extract the domain name from email addresses (e.g., 'company.com' from 'john@company.com')
-- 3. Find the length of each product name and show products with names longer than 15 characters
-- 4. Concatenate first_name and last_name with a space, and make it Title Case (First Letter Capital)
-- 5. Replace all hyphens in phone numbers with dots
-- 6. Trim leading and trailing spaces from product names
-- 7. Extract the first 3 characters from department names
-- 8. Find all employees whose email contains 'company.com' (case-insensitive)
-- 9. Get the position of '@' symbol in email addresses
-- 10. Reverse the product codes
-- 11. Extract the category prefix from product codes (text before first hyphen)
-- 12. Pad employee IDs with zeros on the left to make them 6 digits (e.g., 101 -> 000101)
-- 13. Count the number of words in the 'notes' column of orders (words separated by spaces)
-- 14. Replace 'Electronics' with 'Tech' in product categories
-- 15. Find customers whose names start with a vowel (A, E, I, O, U)

-- DATETIME FUNCTIONS (15 Questions)
-- ----------------------------------------
-- 16. Calculate the age of each employee in years
-- 17. Find employees hired in the last 3 years
-- 18. Calculate how many days each employee has been with the company
-- 19. Extract the year, month, and day separately from hire_date
-- 20. Find all products that will expire within the next 6 months
-- 21. Calculate the day of the week when each employee was hired (e.g., Monday, Tuesday)
-- 22. Find the difference in days between order_date and delivery_date
-- 23. Add 90 days to the last_restock_date and show the next expected restock date
-- 24. Find orders placed in the month of November
-- 25. Calculate the quarter in which each employee was hired (Q1, Q2, Q3, Q4)
-- 26. Find employees whose birthday is in the current month
-- 27. Format hire_date as 'DD-Mon-YYYY' (e.g., '15-Mar-2020')
-- 28. Calculate how many complete months each product has been in stock since last restock
-- 29. Find the last day of the month for each order date
-- 30. Get the week number of the year for each order date

-- MISCELLANEOUS FUNCTIONS (15 Questions)
-- ----------------------------------------
-- 31. Rank employees by salary within their department
-- 32. Calculate a 10% bonus for all employees and round to 2 decimal places
-- 33. Use CASE to categorize salaries: <60000='Entry', 60000-80000='Mid', >80000='Senior'
-- 34. Find the second highest salary in each department
-- 35. Generate a random discount between 5% and 15% for each product
-- 36. Use COALESCE to replace NULL delivery_dates with 'Not Yet Delivered'
-- 37. Calculate the cumulative sum of order amounts ordered by order_date
-- 38. Use NULLIF to return NULL if stock_quantity equals 0, otherwise return the quantity
-- 39. Find employees with salary above the average salary
-- 40. Use IF function to mark products as 'In Stock' if quantity > 50, else 'Low Stock'
-- 41. Calculate the percentage of total sales each order represents
-- 42. Use GREATEST to find the maximum between (salary * 0.1) and 5000 as bonus
-- 43. Convert salary to different currencies (multiply by exchange rate 1.2 for EUR)
-- 44. Use ROW_NUMBER to assign sequential numbers to employees ordered by hire_date
-- 45. Find products where price is between the average price minus 100 and average price plus 100

-- BONUS: COMBINED CHALLENGES (5 Questions)
-- ----------------------------------------
-- 46. Create a full email signature: "FirstName LastName <email> | Dept: DEPARTMENT | Hired: Mon DD, YYYY"
-- 47. Find employees hired more than 2 years ago whose names contain exactly 5 letters
-- 48. For delivered orders, calculate delivery time in hours and categorize as: <24hrs='Express', 24-72hrs='Standard', >72hrs='Delayed'
-- 49. Create a product report showing: UPPER(category), trimmed product name, days until expiry (or 'No Expiry'), and formatted price with currency symbol
-- 50. Generate a performance score: (Years of Service * 10) + (CASE when salary>80000 then 20 when salary>60000 then 10 else 5 END) for each employee

-- ========================================
-- HINTS FOR COMMONLY USED FUNCTIONS
-- ========================================
/*
STRING FUNCTIONS:
- UPPER(), LOWER(), CONCAT(), SUBSTRING(), TRIM(), REPLACE()
- LENGTH(), CHAR_LENGTH(), INSTR(), LOCATE(), LEFT(), RIGHT()
- LPAD(), RPAD(), REVERSE(), SUBSTR()

DATETIME FUNCTIONS:
- CURDATE(), NOW(), DATE(), YEAR(), MONTH(), DAY()
- DATEDIFF(), DATE_ADD(), DATE_SUB(), TIMESTAMPDIFF()
- DAYNAME(), MONTHNAME(), QUARTER(), WEEK()
- DATE_FORMAT(), LAST_DAY(), EXTRACT()

MISCELLANEOUS:
- ROUND(), CEILING(), FLOOR(), RAND(), ABS()
- COALESCE(), NULLIF(), IF(), CASE WHEN
- RANK(), ROW_NUMBER(), LAG(), LEAD()
- GREATEST(), LEAST()
*/