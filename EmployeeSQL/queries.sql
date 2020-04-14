-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.gender AS "Gender",
	s.salary AS "Salary"
FROM employees e
JOIN salaries s ON
	s.emp_no = e.emp_no;

-- List employees who were hired in 1986.
SELECT 
	last_name AS "Last Name",
	first_name AS "First Name",
	hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '1986%';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	d.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dm.from_date AS "Start Date",
	dm.to_date AS "End Date"
FROM departments d
INNER JOIN dept_manager dm ON
	dm.dept_no = d.dept_no
INNER JOIN employees e ON
	e.emp_no = dm.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
JOIN dept_emp de ON
	e.emp_no = de.emp_no
JOIN departments d ON
	de.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name
FROM employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name as "Department Name"
FROM employees e
JOIN dept_emp de ON
	e.emp_no = de.emp_no
JOIN departments d ON
	de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name as "Department Name"
FROM employees e
JOIN dept_emp de ON
	e.emp_no = de.emp_no
JOIN departments d ON
	de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;




