
Drop table titles
CREATE TABLE titles (
    title_id varchar primary key   NOT NULL,
    title varchar(40)   NOT NULL
);

Drop Table employees
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name	VARCHAR(35) NOT NULL,
	last_name	VARCHAR(35) NOT NULL,
	sex	VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

Drop table departments
CREATE TABLE departments (
    dept_no varchar(15) PRIMARY KEY   NOT NULL, 
    dept_name varchar(30)   NOT NULL	
);

Drop table dept_emp
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL, 
	foreign key(dept_no) references departments (dept_no),
	foreign key(emp_no) references employees(emp_no)
);

Drop Table dept_manager
CREATE TABLE dept_manager (
  	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Drop Table salaries
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

drop table departments cascade;