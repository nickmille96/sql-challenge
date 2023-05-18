---List the employee number, last name, first name, sex, and salary of each employee
Select * From employees;
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
Left join salaries
On employees.emp_no = salaries.emp_no;


--List the first name, last name, and hire date for employees who were hired in 1986
Select first_name, last_name, hire_date
From employees
Where date_part('year', hire_date) = 1986
Order by hire_date;

--List the Manager of each department along with their department number, department name, employee number, last name, and first name 
Select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,employees.last_name, employees.first_name
From dept_manager
Left Join departments
On dept_manager.dept_no = departments.dept_no
Left Join employees
On dept_manager.emp_no= employees.emp_no;

--List the department number for each employee along with that employees employee numeber, last name, first name and department name
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp 
On employees.emp_no = dept_emp.emp_no
Inner Join departments
On departments.dept_no = dept_emp.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
Select * From employees
Where first_name = 'Hercules' And last_name like 'B%';

--List each employee in the Sales deparment, including their employee number, last name, and first name
Select employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
From employees 
Left Join dept_emp
On employees.emp_no=dept_emp.emp_no
Inner Join departments
On departments.dept_no=dept_emp.dept_no
Where departments.dept_name =('Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
Select employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no
From employees
Left Join dept_emp
On employees.emp_no=dept_emp.emp_no
Inner Join departments
On departments.dept_no=dept_emp.dept_no
Where departments.dept_name
In ('Sales', 'Development');

--List the frequency count, in descending order, of all the employee last names(that is, how many employees share each last name)
Select last_name, 
Count(*) as freq_count 
From employees 
Group by last_name
Order by freq_count desc;