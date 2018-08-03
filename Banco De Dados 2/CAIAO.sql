desc departments;
--OUTER JOIN com leftc
select d.department_name, e.last_name
    from departments d
        left outer join employees e
        on d.department_id = e.department_id;
        
--OUTER JOIN COM RIGHT
select d.department_name, e.last_name
    from departments d
        right outer join employees e
        on d.department_id = e.department_id;

-- FULL OUTER JOIN

SELECT department_name, last_name
FROM departments d FULL OUTER JOIN  employees e
on d.department_id = e.department_id
order by d.department_name;

SELECT d.department_name, l.city
from departments d  RIGHT OUTER JOIN locations l
on d.location_id = l.location_id
order by department_name;

SELECT e.first_name, e.last_name, d.department_name 
from employees e LEFT OUTER JOIN departments d
on d.manager_id = e.manager_id
order by last_name;

SELECT e.first_name || '' || e.last_name EMpregado, g.first_name || ' '|| g.last_name Gerente
FROM employees e LEFT OUTER JOIN employees g
on e.manager_id = g.employee_id;

SELECT  c.country_name, d.department_name from departments d
join locations l on d.location_id  = l.location_id 
right outer join  countries c using (country_id) ;

SELECT C.COUNTRY_NAME, R.REGION_NAME
FROM COUNTRIES C
    CROSS JOIN REGIONS R
    ORDER BY C.COUNTRY_NAME;
    
    
    
SELECT EMPLOYEE_ID, DEPARTMENT_ID 
FROM EMPLOYEES 
UNION 
SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM JOB_HISTORY;


SELECT J.DEPARTMENT_ID, COUNT(*)
FROM JOB_HISTORY J 
  JOIN EMPLOYEES E
  USING(EMPLOYEE_ID)
  GROUP BY J.DEPARTMENT_ID;

SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES 
INTERSECT 
SELECT EMPLOYEE_ID ,JOB_ID
FROM JOB_HISTORY;

SELECT EMPLOYEE_ID
FROM EMPLOYEES
MINUS
SELECT EMPLOYEE_ID
FROM JOB_HISTORY;

SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES;
 
SELECT COUNT(MANAGAR_ID) FROM EMPLOYEES;