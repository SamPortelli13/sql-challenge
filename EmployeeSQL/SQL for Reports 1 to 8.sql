/* Data Analysis - Report 1
	List the following details of each employee: employee number, last name, first name, sex, and salary.
*/
select employees.emp_no as "employee number", last_name as "last name", first_name as "first name", sex, cast(salary as money)
from employees 
left outer join salaries on employees.emp_no = salaries.emp_no
order by last_name, first_name;

/* Data Analysis - Report 2
	List first name, last name, and hire date for employees who were hired in 1986.
*/
select first_name as "first name", last_name as "last name", hire_date as "hire date"
from employees 
where hire_date between '1/1/1986' and '1/12/1986'
order by last_name, first_name;

/* Data Analysis - Report 3
	List the manager of each department with the following information: department number, department name, 
	the manager's employee number, last name, first name.
*/
select departments.dept_no as "department number", dept_name as "department name", dept_manager.emp_no as "manager's employee number",
	last_name as "last name", first_name as "first name"
from departments
left outer join dept_manager on dept_manager.dept_no = departments.dept_no
left outer join employees on dept_manager.emp_no = employees.emp_no;

/* Data Analysis - Report 4
	List the department of each employee with the following information: employee number, last name, first name, and department name.
*/
select employees.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name"
from employees
left outer join dept_emp on employees.emp_no = dept_emp.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
order by last_name, first_name;

/* Data Analysis - Report 5
	List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
*/
select first_name as "first name", last_name as "last name", sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

/* Data Analysis - Report 6
	List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/
select employees.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name"
from employees
left outer join dept_emp on employees.emp_no = dept_emp.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by last_name, first_name;

/* Data Analysis - Report 7
	List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/
select employees.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name"
from employees
left outer join dept_emp on employees.emp_no = dept_emp.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name in( 'Sales','Development')
order by last_name, first_name;

/* Data Analysis - Report 8
	In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
select last_name as "last name", count(last_name) as "frequency count"
from employees
group by last_name
order by count(last_name) desc;
