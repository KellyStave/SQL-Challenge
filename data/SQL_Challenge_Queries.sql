--List the employee number, last name, first name, sex, and salary of each employee
select employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary 
from employee
join salaries
on (employee.emp_no = salaries.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986
select employee.first_name, employee.last_name, employee.hire_date 
from employee
where hire_date between '01-01-1986' and '12-31-1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name
select dept_manager.dept_no, dept_manager.emp_no, dept.dept_name, employee.last_name, employee.first_name 
from dept_manager
	join employee
	on (dept_manager.emp_no = employee.emp_no)
		join dept
		on (dept_manager.dept_no = dept.dept_no)

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select employee.emp_no, employee.last_name, employee.first_name, dept_emp.dept_no, dept.dept_name
from employee
join dept_emp 
on (dept_emp.emp_no = employee.emp_no)
join dept 
on (dept.dept_no = dept_emp.dept_no)

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select employee.first_name, employee.last_name, employee.sex 
from employee
where first_name like  '%Hercules%' and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
select employee.emp_no, employee.last_name, employee.first_name
from employee
where emp_no in 
(	select emp_no 
	from dept_emp
	where dept_no  in 
	(	select dept_no 
		from dept
		where dept_name = 'Sales'
))

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select employee.emp_no, employee.last_name, employee.first_name, dept.dept_name 
from employee
	inner join dept_emp
	on employee.emp_no = dept_emp.emp_no 
		inner join dept
		on dept.dept_no = dept_emp.dept_no 
			where employee.emp_no in 
			(	select dept_emp.emp_no 
				from dept_emp
				where dept_no  in 
					(	select dept.dept_no 
						from dept
						where dept_name = 'Sales' or dept_name = 'Development'
))
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select count(*), employee.last_name  
from employee
group by employee.last_name
order by count(distinct (employee.last_name)) desc 