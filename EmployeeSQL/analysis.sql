-- tables to reference
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
FROM employees AS emp
JOIN salaries ON emp.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE DATE_PART('year', hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM dept_emp JOIN employees on dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
-- sales = d007
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no IN(
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN(
		SELECT dept_no FROM departments
		WHERE dept_no = 'd007'))

-- 7. List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS last_name_frequency FROM employees
GROUP BY last_name ORDER BY last_name_frequency DESC;
