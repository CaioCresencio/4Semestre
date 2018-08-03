SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;


SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    

SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
ORDER BY E.LAST_NAME;


SELECT E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES E
    INNER JOIN JOBS J
    USING (JOB_ID)
ORDER BY E.LAST_NAME;


SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME
FROM DEPARTMENTS D
    INNER JOIN LOCATIONS L USING (LOCATION_ID)
    INNER JOIN COUNTRIES C USING(COUNTRY_ID)
ORDER BY D.DEPARTMENT_NAME;
    

SELECT E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES E
NATURAL JOIN JOBS J
ORDER BY E.LAST_NAME;


SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM DEPARTMENTS D
NATURAL JOIN LOCATIONS L
NATURAL JOIN COUNTRIES C
NATURAL JOIN REGIONS R
ORDER BY D.DEPARTMENT_NAME;

/* SOBRENOME E NOME DE DEPARTAMENTO DOS EMPREGADOS
CUJO GERENTE TAMB�M � GERENTE DO DEPARTAMENTO 
AO QUAL O EMPREGADO PERTENCE
*/
SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
ORDER BY E.LAST_NAME;


SELECT LAST_NAME, DEPARTMENT_ID, MANAGER_ID
FROM EMPLOYEES
ORDER BY LAST_NAME;

SELECT MANAGER_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 50;

SELECT E.LAST_NAME, E.JOB_ID, H.START_DATE, H.END_DATE
FROM EMPLOYEES E, JOB_HISTORY H
WHERE E.EMPLOYEE_ID = H.EMPLOYEE_ID;

/*DADOS DO EMPREGADO CUJO O CARGO E DEPARTAMENTO ATUAIS
J� FORAM OCUPADOS POR ELE ANTERIORMENTE
*/
SELECT E.LAST_NAME, JOB_ID, JH.START_DATE, JH.END_DATE
FROM EMPLOYEES E NATURAL JOIN JOB_HISTORY JH;

SELECT E.LAST_NAME, J.JOB_TITLE, JH.START_DATE, JH.END_DATE
FROM EMPLOYEES E 
    JOIN JOBS J USING(JOB_ID)
    JOIN JOB_HISTORY JH USING(EMPLOYEE_ID)
ORDER BY E.LAST_NAME;

SELECT E.LAST_NAME, JH.START_DATE, JH.END_DATE, JH.JOB_ID
FROM JOB_HISTORY JH
    INNER JOIN EMPLOYEES E
    USING (EMPLOYEE_ID)
ORDER BY E.LAST_NAME;

SELECT D.DEPARTMENT_NAME, COUNTRY_ID
FROM DEPARTMENTS D
    INNER JOIN LOCATIONS L USING (LOCATION_ID)
    INNER JOIN COUNTRIES C USING (COUNTRY_ID)
WHERE COUNTRY_ID = 'US'
ORDER BY D.DEPARTMENT_NAME;

SELECT D.DEPARTMENT_NAME, COUNTRY_ID
FROM DEPARTMENTS D
    NATURAL JOIN LOCATIONS
    NATURAL JOIN COUNTRIES
WHERE COUNTRY_ID = 'US'
ORDER BY D.DEPARTMENT_NAME;

SELECT E.LAST_NAME Empregado, M.LAST_NAME Gerente
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY M.LAST_NAME, E.LAST_NAME;

SELECT E.LAST_NAME Empregado, M.LAST_NAME Gerente
FROM EMPLOYEES E
    INNER JOIN EMPLOYEES M
    ON E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY M.LAST_NAME;

SELECT D.DEPARTMENT_NAME, E.LAST_NAME
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_NAME;