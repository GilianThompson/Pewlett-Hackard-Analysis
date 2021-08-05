-- Retirement eligibility
SELECT first_name, last_name
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' and '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

--recreate retirement_info to include emp_no 
--DROP TABLE retirement_info;
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
--check the table
SELECT * FROM retirement_info;

SELECT first_name, last_name, title
FROM retirement_info as r 
LEFT JOIN titles as t ON r.emp_no = t.emp_no;

--joining departments and dept_manager tables 
SELECT d.dept_no, 
	dm.emp_no, 
	dm.from_date, 
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm ON d.dept_no = dm.dept_no; 

--joining retirement_info and dept_employees tables
--creates a table of current employees eligible for retirement 
SELECT ri.emp_no, 
	ri.first_name, 
	ri.last_name, 
	de.to_date
INTO current_emp 
FROM retirement_info as ri
LEFT JOIN dept_employees as de ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

--join the current_emp and dept_emp tables
--employee count by department number 
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_count_by_dept_no
FROM current_emp as ce 
LEFT JOIN dept_employees as de ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no; 

SELECT * FROM emp_count_by_dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC; 

--new table of current employees eligible for retirement 
-- but with added gender column 
SELECT emp_no,
	first_name, 
	last_name, 
	gender
INTO emp_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--join emp_info, salaries, and dept_employees
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary, 
	de.to_date 
INTO emp_info
FROM employees as e 
INNER JOIN salaries as s 
ON (e.emp_no = s.emp_no) 
INNER JOIN dept_employees as de 
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' 
	AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');

--list of managers per department 
SELECT 
	dm.dept_no,
	d.dept_name, 
	dm.emp_no,
	ce.last_name, 
	ce.first_name, 
	dm.from_date, 
	dm.to_date
INTO manager_info 
FROM dept_manager as dm
INNER JOIN departments as d on dm.dept_no = d.dept_no
INNER JOIN current_emp as ce ON dm.emp_no = ce.emp_no;

SELECT * FROM manager_info; 

--adding dept_name to current_emp table 
SELECT ce.emp_no, 
	ce.first_name, 
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce 
INNER JOIN dept_employees as de ON ce.emp_no = de.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no; 

--create new table with retirement_info for Sales department 
SELECT dept_info.emp_no,
	dept_info.first_name, 
	dept_info.last_name,
	dept_info.dept_name
INTO retirement_info_sales
FROM dept_info 
WHERE dept_info.dept_name = 'Sales';

--create new table with retirement_info for Sales and Development department
SELECT dept_info.emp_no,
	dept_info.first_name, 
	dept_info.last_name,
	dept_info.dept_name
INTO retirement_info_sales_dev
FROM dept_info
WHERE dept_info.dept_name IN ('Sales', 'Development');