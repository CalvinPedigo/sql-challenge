-- create all tables that match the csv files
-- and matching primary and foreign keys with each other.

CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL);

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(25) NOT NULL);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no));

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no));