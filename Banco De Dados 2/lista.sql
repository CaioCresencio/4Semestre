--1--
SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES;
 --2--
SELECT COUNT(DISTINCT(MANAGER_ID)) FROM EMPLOYEES;
--3--
SELECT JOB_ID, COUNT(EMPLOYEE_ID)
FROM JOBS J
JOIN EMPLOYEES E
USING(JOB_ID)
GROUP BY JOB_ID;

--4--
SELECT MANAGER_ID, TRUNC(AVG(E.SALARY),2) MEDIA
FROM EMPLOYEES E 
GROUP BY MANAGER_ID
HAVING  AVG(E.SALARY) > 5000
ORDER BY MEDIA DESC;

--5--
SELECT MANAGER_ID
FROM DEPARTMENTS
UNION
SELECT MANAGER_ID
FROM EMPLOYEES;

--6--
SELECT MANAGER_ID
FROM DEPARTMENTS
INTERSECT 
SELECT MANAGER_ID
FROM EMPLOYEES;

--7--
SELECT MANAGER_ID
FROM DEPARTMENTS
MINUS
SELECT MANAGER_ID
FROM EMPLOYEES;

--8--
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
  JOIN EMPLOYEES E
  USING(DEPARTMENT_ID)
  MINUS
  SELECT JOB_TITLE
  FROM JOBS 
  WHERE JOB_TITLE <> 'CLERK';

