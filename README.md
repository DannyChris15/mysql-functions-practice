# MySQL Functions Mastery Practice 🚀

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A hands-on practice project with **50 questions** covering String Functions, DateTime Functions, and advanced SQL techniques in MySQL.

## 🎯 What's Inside

- **3 realistic tables** (Employees, Products, Orders) with real-world data issues
- **50 practice questions** from beginner to expert level
- **Complete solutions** with detailed explanations
- Real scenarios: employee management, inventory tracking, order processing

## 📊 Dataset Overview

**Employees Table (7 records)**
- Mixed-case names, various phone formats, salary data
- Fields: employee_id, first_name, last_name, email, phone_number, hire_date, birth_date, salary, department, job_title

**Products Table (7 records)**
- Product catalog with pricing, stock, and expiry tracking
- Fields: product_id, product_name, category, price, stock_quantity, last_restock_date, expiry_date, product_code

**Orders Table (7 records)**
- Customer orders with delivery tracking
- Fields: order_id, customer_name, order_date, delivery_date, order_status, total_amount, notes

## 📚 Practice Topics

**String Functions (Q1-15)**  
Text manipulation and cleaning: `CONCAT()`, `SUBSTRING()`, `REPLACE()`, `TRIM()`, `UPPER()`, `LOWER()`, `LENGTH()`, etc.

**DateTime Functions (Q16-30)**  
Date calculations and formatting: `DATEDIFF()`, `DATE_FORMAT()`, `TIMESTAMPDIFF()`, `DATE_ADD()`, `QUARTER()`, etc.

**Advanced Functions (Q31-45)**  
Window functions and analytics: `RANK()`, `ROW_NUMBER()`, `CASE`, `COALESCE()`, `NULLIF()`, aggregates, and more.

**Bonus Challenges (Q46-50)**  
Complex multi-function queries combining all skills.

## 🚀 Quick Start

```bash
# Clone the repo
git clone https://github.com/DannyChris15/mysql-functions-practice.git
cd mysql-functions-practice

# Set up database
mysql -u your_username -p < Dataset.sql

# Start practicing
# Open 'Practice Questions.sql' and solve the questions
# Check your answers in 'Solutions.sql'
```

## 📁 Project Files

- **Dataset.sql** - Database creation with 3 tables and sample data
- **Practice Questions.sql** - 50 progressive questions with hints
- **Solutions.sql** - Complete solutions with explanations
- **README.md** - This file

## 💡 What You'll Learn

✅ Master 40+ MySQL functions across different categories  
✅ Clean and transform messy real-world data  
✅ Perform complex date calculations and formatting  
✅ Use window functions for analytics  
✅ Write efficient, production-ready queries  
✅ Handle NULL values and edge cases  

## 🎯 Difficulty Levels

- **Q1-20**: Beginner (Single function usage)
- **Q21-35**: Intermediate (Multiple functions, subqueries)
- **Q36-45**: Advanced (Window functions, complex logic)
- **Q46-50**: Expert (Multi-function challenges)

## 🤝 Contributing

Found an issue or want to add more questions? Contributions welcome! Feel free to:
- Submit bug fixes
- Add more practice questions
- Improve solutions with alternative approaches
- Enhance documentation

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Connect With Me

**GitHub**: [@DannyChris15](https://github.com/DannyChris15)
**LinkedIn**: www.linkedin.com/in/daniel-christian-anane-boadaa-a62393225

---

⭐ **Star this repo if you find it helpful!**

*Happy Learning! 🎉*

*Last Updated: December 2024*