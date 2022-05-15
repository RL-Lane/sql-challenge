-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM dept_manager
JOIN departments
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'
ORDER BY last_name, first_name;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'
	OR dept_name = 'Development'
ORDER BY last_name, first_name;


-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;




