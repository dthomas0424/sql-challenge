--List the employee number, last name, first name, sex, and salary of each employee (2 points)

select e.emp_no, e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
	from employees as e
	inner join salaries as s on e.emp_no=s.emp_no 

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

select first_name as "First Name", last_name as "Last Name", hire_date as "Date Hired" 
	from employees
	where hire_date >= '1-1-1986'
	and hire_date <= '12-31-1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

select e.first_name || ' ' || e.last_name as "Manager_Name", dm.dept_no as "Department Number", de.dept_name as "Department Name", e.emp_no, e.last_name as "Last Name", e.first_name as "First Name"
	from employees e 
	inner join dept_manager dm on dm.emp_no = e.emp_no
	inner join departments de on de.dept_no = dm.dept_no
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

select de.dept_no, e.emp_no, e.last_name as "Last Name", e.first_name as "First Name", de.dept_name as "Department Name"
	from departments de
	inner join dept_emp on dept_emp.dept_no = de.dept_no
	inner join employees e on e.emp_no = dept_emp.emp_no
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

select first_name as "First Name", last_name as "Last Name", sex 
	from employees
	where first_name = 'Hercules'
	and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)

select e.emp_no, e.last_name as "Last Name", e.first_name as "First Name"
	from employees e
	inner join dept_emp dpe on e.emp_no = dpe.emp_no
	inner join departments de on de.dept_no = dpe.dept_no
	where de.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

select e.emp_no, e.last_name as "Last Name", e.first_name as "First Name", de.dept_name as "Department Name"
	from employees e
	inner join dept_emp dpe on e.emp_no = dpe.emp_no
	inner join departments de on de.dept_no = dpe.dept_no
	where de.dept_name in ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

select distinct last_name as "Last Name", count(last_name)
	from employees
	group by last_name
	order by last_name desc