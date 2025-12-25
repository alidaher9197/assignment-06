--creating database company_db
CREATE DATABASE company_db;
USE company_db;
--creating table employees
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(70),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    city VARCHAR(50)
);
--filling values in employees table
INSERT INTO 
employees(emp_name,department,salary,manager_id,city)
VALUES
("Noor", "HR", 50000, 3, "Beirut"),
("Hassan", "IT", 60000, 4, "Baalback"),
("Hady", "HR", 70000, NULL, "Beirut"),
("Ali", "IT", 80000, NULL, "Tripoli"),
("Mouhammad", "Sales", 45000, 6, "Saida"),
("Zayn", "Sales", 65000, NULL, "Beqaa");

--part a distick departments
SELECT DISTINCT department FROM employees;

--part b

SELECT emp_name,salary 
FROM employees 
WHERE salary>50000 AND department IN ("IT","HR");

--part c
SELECT emp_name FROM employees WHERE emp_name LIKE "H%";

--part d
SELECT * FROM employees ORDER BY salary DESC LIMIT 3 ;

--part e
SELECT MAX(salary),department FROM employees GROUP BY department ;

--part f
SELECT SUM(salary),department FROM employees GROUP BY department WITH ROLLUP ;

--part g

SELECT * FROM employees WHERE city="Beirut"
UNION
SELECT * FROM employees WHERE city="Beqaa";

--part h

SELECT t1.emp_id,t1.emp_name,t1.manager_id,t2.emp_name FROM
employees as t1 
LEFT JOIN
employees as t2
ON
t1.manager_id=t2.emp_id;

--part i
SELECT emp_name,salary FROM employees WHERE salary>(SELECT AVG(salary) FROM employees);

--part j
CREATE VIEW IT_Employees AS
SELECT emp_name,department,salary 
FROM employees 
WHERE department="IT";

--part k
SELECT * FROM IT_Employees;

--part l

DELIMITER $$
CREATE PROCEDURE GetAllEmployees()
BEGIN
SELECT * FROM employees;
END $$
DELIMITER ;

CALL getAllEmployees();
--part m

DELIMITER $$
CREATE PROCEDURE GetEmployeesByDepartment(IN department_name VARCHAR(70))
BEGIN
SELECT * FROM employees WHERE employees.department=department_name;
end $$
DELIMITER ;

CALL GetEmployeesByDepartment("sales");