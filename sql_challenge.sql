create table departments(
	dept_no varchar,
	dept_name varchar
);


create table dept_emp(
	emp_no int,
	dept_no varchar
);

create table dept_manager(
	dept_no varchar,
	emp_no int
);

create table employees(
	emp_no int,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date
);

create table salaries(
	emp_no int,
	salary int
);

create table titles(
	title_id varchar,
	title varchar
);
select * from employees;
-- Question 1
create view emp_salary as
select birth_date, first_name, last_name, sex from employees 
inner join salaries on employees.emp_no = salaries.emp_no;

select * from emp_salary;

-- Question 2
select first_name, last_name, hire_date from employees
Where 
hire_date >= '1986-01-01' and 
hire_date < '1987-01-01';

-- Question 3
select dept_name, departments.dept_no, first_name, last_name, employees.emp_no from departments
inner join dept_manager on dept_manager.dept_no = departments.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

-- Question 4
select dept_emp.emp_no, last_name, first_name, dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

-- Question 5
select first_name, last_name, sex from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- Question 6
select employees.emp_no, first_name, last_name, dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';

-- Question 7
select employees.emp_no, first_name, last_name, dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- Qustion 8
SELECT last_name, count(last_name)  AS "Count" FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;
