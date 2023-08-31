create table titles
(
	title_id varchar(10) primary key,
	title varchar(30) not null
);

create table employees
(
	emp_no int primary key,
	emp_title_id varchar(10),
	foreign key (emp_title_id) references titles(title_id),
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(5),
	hire_date date not null
);

create table salaries
(
	emp_no int primary key,
	salary int not null,
	foreign key (emp_no) references employees(emp_no)
);

create table departments
(
	dept_no varchar(10) primary key,
	dept_name varchar(30) not null
);

create table dept_manager
(
	dept_no varchar(10) not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

create table dept_emp
(
	emp_no int not null,
	dept_no varchar(10) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);




