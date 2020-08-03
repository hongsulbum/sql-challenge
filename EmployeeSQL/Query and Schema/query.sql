SELECT employee_number, last_name, first_name, sex, salary
FROM company_employee_data

SELECT first_name, last_name, hire_date
FROM company_employee_data
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

SELECT department_number, department_name, employee_number, last_name, first_name
FROM company_employee_data
WHERE title = 'Manager'

SELECT employee_number, last_name, first_name, department_name
FROM company_employee_data

SELECT first_name, last_name, sex
FROM company_employee_data
WHERE first_name = 'Hercules' AND last_name LIKE 'B&'

SELECT employee_number, last_name, first_name, department_name
FROM company_employee_data
WHERE department_name = 'Sales'

SELECT employee_number, last_name, first_name, department_name
FROM company_employee_data
WHERE department_name = 'Sales' OR department_name = 'Development'

SELECT last_name, COUNT(last_name) AS "name frequency"
FROM company_employee_data
GROUP BY last_name
ORDER BY "name frequency" DESC