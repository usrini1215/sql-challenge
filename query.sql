--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no = s.emp_no 
ORDER BY 1;



--List first name, last name, and hire date 
--for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE TO_CHAR(e.hire_date,'YYYY-MM-DD') like '%1986%'
-- also can use this based on Postgres documentation
--WHERE DATE_PART('year', e.hire_date) = 1986



--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dm. dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN employees e ON 
dm.emp_no = e.emp_no
INNER JOIN departments d ON
dm.dept_no = d.dept_no



--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON 
de.emp_no = e.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no


--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name like 'B%'



--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON 
de.emp_no = e.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'



--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON 
de.emp_no = e.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')



--In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT e.last_name,count(e.last_name)
FROM employees e
GROUP BY e.last_name
ORDER BY 2 DESC 


--Epilogue query :) April fools day!!!
select * from employees where emp_no = 499942
select * from dept_manager  where emp_no = 499942
select * from salaries  where emp_no = 499942

