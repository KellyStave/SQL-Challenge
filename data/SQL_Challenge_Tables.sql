--Create a table schema for each of the six CSV files
create table dept (
dept_no varchar primary key,
dept_name varchar
);
select * from dept

create table title (
title_id varchar primary key,
title varchar
);
select * from title

create table employee (
emp_no varchar primary key,
emp_title_id varchar,
birth_date date,
first_name varchar,
last_name varchar,
sex varchar,
hire_date date,
foreign key(emp_title_id) references title(title_id)
);
select * from employee

create table dept_manager (
dept_no varchar,
emp_no varchar,
primary key (dept_no, emp_no),
foreign key (dept_no) references dept(dept_no),
foreign key (emp_no) references employee(emp_no)
);
select * from dept_manager

create table dept_emp (
emp_no varchar,
dept_no varchar,
primary key (emp_no, dept_no),
foreign key (emp_no) references employee(emp_no),
foreign key (dept_no) references dept(dept_no)
);
select * from dept_emp 

create table salaries (
emp_no varchar,
salary int,
primary key (emp_no, salary),
foreign key (emp_no) references employee(emp_no)
)
select * from salaries


