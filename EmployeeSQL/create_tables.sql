-- table which links department number to department name
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);
-- validate data loaded
SELECT * FROM departments;


-- table which defines job titles
CREATE TABLE titles (
	emp_title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30)
);

SELECT * FROM titles;


-- table which defines each employee
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(5),
	FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex CHAR,
	hire_date DATE
);
-- validate data loaded
SELECT * FROM employees;
-- count all employees
SELECT COUNT(emp_no) FROM employees;
-- 300024


-- table which links employee number to department number (foreign key)
CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);
-- validate data loaded
SELECT * FROM dept_emp;
-- count all employees in departments
SELECT COUNT(emp_no) FROM dept_emp;
-- 331603


-- table which links specific employees to departments (both foreign keys)
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN kEY (emp_no)  REFERENCES employees(emp_no)
);
-- validate data loaded
SELECT * FROM dept_manager;


-- table which defines salaries
CREATE TABLE salaries  (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER
);
-- validate data loaded
SELECT * FROM salaries;
-- count all salary fields
SELECT COUNT(emp_no) FROM salaries;
-- 300024
