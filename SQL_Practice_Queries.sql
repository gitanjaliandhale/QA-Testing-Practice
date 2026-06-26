-- ============================================
-- SQL Practice Queries
-- Name: Gitanjali Andhale
-- Database: internship_db
-- ============================================

USE internship_db;

-- 1. Display all employees
SELECT * FROM Employee;

-- 2. Top 5 Highest Salaries
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;

-- 3. Department-wise Employee Count
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 4. Second Highest Salary
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 5. Employees Whose Salary is Greater Than Department Average
SELECT e.emp_name, e.salary, d.dept_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

-- 6. INNER JOIN
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

-- 7. LEFT JOIN
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

-- 8. GROUP BY with HAVING Clause
SELECT dept_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- 9. Employees Hired in Last 6 Months
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 10. Find Duplicate Employee Names
SELECT emp_name, COUNT(*) AS total
FROM Employee
GROUP BY emp_name
HAVING COUNT(*) > 1;

-- 11. Remove Duplicate Records
DELETE e1
FROM Employee e1
JOIN Employee e2
ON e1.emp_name = e2.emp_name
AND e1.emp_id > e2.emp_id;