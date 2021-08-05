
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
	t.to_date
INTO Deliverable1 
FROM employees as e 
INNER JOIN titles as t ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM Deliverable1; 


SELECT DISTINCT ON (d1.emp_no)
	d1.emp_no,
	d1.first_name, 
	d1.last_name,
	d1.title
INTO unique_titles
FROM Deliverable1 as d1
ORDER BY d1.emp_no ASC, d1.to_date DESC;

--retrieve the number of employees by their most recent 
--job title who are about to retire
SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles 
FROM unique_titles 
GROUP BY unique_titles.title
ORDER BY COUNT(unique_titles.title) DESC;

--employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(e.emp_no) 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_employees as de ON e.emp_no = de.emp_no 
INNER JOIN titles as t ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01') 
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no; 
