CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(70),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    city VARCHAR(50)
);