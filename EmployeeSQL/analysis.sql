--check if the CSV data is imported correctly
select * from departments;
select * from titles;
select count(*) from employees;
select count(*) from salaries;
select count(*) from dept_manager;
select count(*) from dept_emp;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees e
join salaries s
	on e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
select 
	first_name,
	last_name,
	hire_date 
from employees 
where hire_date between date '1986-01-01' and date '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
	d.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
from departments d
join dept_manager m
	on d.dept_no = m.dept_no
join employees e
	on m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	m.dept_name
from employees e
join dept_emp d
	on e.emp_no = d.emp_no
join departments m
	on d.dept_no = m.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select
	first_name,
	last_name,
	sex
from employees 
where first_name = 'Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	m.dept_name
from employees e
join dept_emp d
	on e.emp_no = d.emp_no
join departments m
	on d.dept_no = m.dept_no
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	m.dept_name
from employees e
join dept_emp d
	on e.emp_no = d.emp_no
join departments m
	on d.dept_no = m.dept_no
where dept_name = 'Sales' 
or dept_name = 'Development' ;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
	last_name,
	count(*) as "Last Name Counter"
from employees
group by last_name
order by "Last Name Counter" desc;