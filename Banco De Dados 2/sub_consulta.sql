--CONSULTAS ANINHADAS (SUBCONSULTAS)--
SELECT last_name, salary
FROM employees
WHERE salary >
    (SELECT salary 
    FROM employees
    WHERE last_name = 'Gates');
    

SELECT * FROM DEPARTMENTS WHERE ROWNUM BETWEEN 1 AND 16;
SELECT first_name,salary
FROM employees
WHERE job_id =
    (SELECT  job_id
     FROM employees 
     WHERE last_name = 'Abel') 
     AND salary > 
     (SELECT salary
     FROM employees
     WHERE last_name = 'Chen')
     ORDER BY first_name DESC;
    
SELECT first_name , hire_date
FROM employees
WHERE hire_date <
    (SELECT hire_date
    FROM employees
    WHERE last_name = 'Matos');


SELECT last_name, job_id
FROM employees 
WHERE salary  = 
    (SELECT MIN(SALARY)
     FROM EMPLOYEES);
     
SELECT TRUNC(AVG(salary),2)
FROM employees
GROUP BY department_id
    HAVING AVG(SALARY) >
    (SELECT AVG(SALARY)
    FROM employees
    JOIN departments
    USING(department_id)
    WHERE department_name = 'Sales'
    GROUP BY department_id);
    
SELECT first_name, last_name
FROM employees
WHERE salary > (
    SELECT salary 
    FROM employees 
    JOIN departments
    USING(department_id)
    WHERE DEPARTMENT_NAME = 'IT');
    
SELECT last_name 
FROM employees
WHERE salary in(
    SELECT salary
    FROM employees
    WHERE job_id = 'IT_PROG');
    
SELECT department_name 
FROM departments
WHERE location_id not in
    (SELECT location_id
    FROM locations
    JOIN countries
    USING (country_id)
    WHERE country_name like '%United States%');
    
SELECT last_name
FROM employees
JOIN departments
USING(manager_id)
    WHERE salary NOT IN
    (SELECT salary 
     FROM employees 
     WHERE job_id like '%Programmer');
     
         
SELECT last_name
FROM employees
    WHERE salary < ANY
    (SELECT salary 
     FROM employees 
     WHERE job_id like '%IT_PROG');
     
     
SELECT last_name
FROM employees
WHERE salary > ANY
    (SELECT salary
     FROM employees
    WHERE employee_id in
    (SELECT manager_id
     FROM departments));
     
     
SELECT last_name, salary
FROM employees
WHERE Job_id <> 'IT_PROG'
AND salary < ALL 
    (SELECT salary
     FROM employees
     WHERE job_id = 'IT_PROG');

    
    