CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR
);

CREATE TABLE employees (
	employee_number INT PRIMARY KEY NOT NULL,
	employee_title_id VARCHAR,
	FOREIGN KEY (employee_title_id) REFERENCES titles,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE departments (
	department_number VARCHAR PRIMARY KEY NOT NULL,
	department_name VARCHAR
);

CREATE TABLE department_managers (
	department_number VARCHAR NOT NULL,
	FOREIGN KEY (department_number) REFERENCES departments,
	employee_number INT NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees,
	PRIMARY KEY (department_number, employee_number)
);

CREATE TABLE department_employees (
	employee_number INT NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees,
	department_number VARCHAR NOT NULL,
	FOREIGN KEY (department_number) REFERENCES departments,
	PRIMARY KEY (employee_number, department_number)
);
	
CREATE TABLE salaries (
	employee_number INT,
	FOREIGN KEY (employee_number) REFERENCES employees,
	salary INT,
	PRIMARY KEY (employee_number, salary)
);

CREATE VIEW company_employee_data AS
SELECT emp.employee_number, titles.title, emp.birth_date, emp.first_name, emp.last_name, emp.sex, emp.hire_date, dn.department_name, de.department_number, sal.salary
FROM employees AS emp
JOIN titles ON emp.employee_title_id = titles.title_id
JOIN department_employees AS de ON emp.employee_number = de.employee_number
JOIN salaries AS sal ON emp.employee_number = sal.employee_number
JOIN departments AS dn ON de.department_number = dn.department_number;



