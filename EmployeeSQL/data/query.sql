--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.lastname,employees.firstname, employees.sex, salaries.salary
    FROM employees 
	INNER JOIN salaries ON (employees.emp_no = salaries.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT firstname, lastname, hire_date 
	FROM employees
	WHERE hire_date LIKE '%1986'

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, m.emp_no, e.lastname, e.firstname
	FROM dept_manager m
		LEFT JOIN departments d
			ON m.dept_no = d.dept_no
		LEFT JOIN employees e
			ON e.emp_no = m.emp_no
	ORDER BY dept_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--Note: some employees are listed in multiple departments
SELECT e.emp_no, e.lastname, e.firstname, d.dept_name
	FROM employees e
		LEFT JOIN dept_emp j
			ON j.emp_no = e.emp_no
		LEFT JOIN departments d
			ON j.dept_no = d.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.firstname, employees.lastname, employees.sex
	FROM employees
	WHERE firstname = 'Hercules' AND lastname LIKE 'B%'
			
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.lastname, e.firstname, d.dept_name
	FROM employees e
		LEFT JOIN dept_emp j
			ON j.emp_no = e.emp_no
		LEFT JOIN departments d
			ON j.dept_no = d.dept_no
			WHERE dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.lastname, e.firstname, d.dept_name
	FROM employees e
		LEFT JOIN dept_emp j
			ON j.emp_no = e.emp_no
		LEFT JOIN departments d
			ON j.dept_no = d.dept_no
			WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(emp_no), lastname
	FROM employees
	GROUP BY lastname
	ORDER BY COUNT(lastname) DESC;
