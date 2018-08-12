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


SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE, E.DEPARTMENT_ID
FROM EMPLOYEES E
WHERE E.HIRE_DATE <
    (SELECT M.HIRE_DATE
    FROM EMPLOYEES M 
    WHERE M.LAST_NAME = 'Matos'
    AND M.DEPARTMENT_ID = E.DEPARTMENT_ID);
    
SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE, E.DEPARTMENT_ID,M.HIRE_DATE
FROM EMPLOYEES E, EMPLOYEES M
    WHERE M.LAST_NAME = 'Matos'
    AND E.HIRE_DATE < M.HIRE_DATE
    AND E.DEPARTMENT_ID = M.DEPARTMENT_ID;

SELECT E.FIRST_NAME, E.SALARY, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J
USING (JOB_ID)
    WHERE E.SALARY >
    (SELECT M.SALARY
     FROM  EMPLOYEES M
     WHERE M.EMPLOYEE_ID = E.MANAGER_ID);

SELECT E.FIRST_NAME
FROM EMPLOYEES E
    WHERE E.HIRE_DATE IN 
    (SELECT E2.HIRE_DATE
    FROM EMPLOYEES E2
    WHERE E.DEPARTMENT_ID = E2.DEPARTMENT_ID
    AND E.EMPLOYEE_ID <> E2.EMPLOYEE_ID);
    
SELECT department_name
FROM departments D
WHERE EXISTS
    (SELECT * FROM employees E
    WHERE D.department_id = E.department_id);

SELECT L.CITY
FROM LOCATIONS L 
    WHERE EXISTS
    (SELECT * FROM DEPARTMENTS D
    WHERE D.LOCATION_ID = L.LOCATION_ID);
    
    
SELECT R.REGION_NAME, R.REGION_ID
FROM REGIONS R
    WHERE NOT EXISTS 
    (SELECT * FROM DEPARTMENTS D, COUNTRIES C, LOCATIONS L
    WHERE D.LOCATION_ID = L.LOCATION_ID 
    AND L.COUNTRY_ID  = C.COUNTRY_ID 
    AND C.REGION_ID = R.REGION_ID);
   
    