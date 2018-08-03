/*1: Recuperar o sobrenome, telefone e o email dos funcionários com job_title = ‘Programmer’*/
SELECT E.LAST_NAME, E.PHONE_NUMBER, E.EMAIL
FROM EMPLOYEES E
    INNER JOIN JOBS J
    ON J.JOB_TITLE = 'Programmer'
ORDER BY E.LAST_NAME ASC;

/*2: Recuperar o primeiro nome e o sobrenome dos funcionários dos departamentos com nome ‘Sales’ ou ‘Marketing’*/
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
    WHERE (D.DEPARTMENT_NAME = 'Sales'
    OR D.DEPARTMENT_NAME = 'Marketing')
ORDER BY E.FIRST_NAME ASC;

/*3: Para cada departamento, recuperar o nome do departamento e o sobrenome do seu gerente*/
SELECT D.DEPARTMENT_NAME, E.LAST_NAME
FROM DEPARTMENTS D
    LEFT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_NAME ASC;

/*4: Para cada departamento, recuperar o nome do departamento e sua cidade*/
SELECT D.DEPARTMENT_NAME, L.CITY
FROM DEPARTMENTS D
    LEFT OUTER JOIN LOCATIONS L
    USING (LOCATION_ID)
ORDER BY D.DEPARTMENT_NAME ASC;

/*5: Para cada departamento, recuperar o nome do departamento, sua cidade e o nome do país*/
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
FROM DEPARTMENTS D
    NATURAL JOIN LOCATIONS L
    NATURAL JOIN COUNTRIES C
ORDER BY D.DEPARTMENT_NAME ASC;

/*6: Para cada departamento, recuperar o nome do departamento, sua cidade e o nome do país, para países que contenham ‘United’ no nome*/
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
FROM DEPARTMENTS D
    LEFT OUTER JOIN LOCATIONS L 
    USING (LOCATION_ID)
    INNER JOIN COUNTRIES C
    USING (COUNTRY_ID)
    WHERE COUNTRY_NAME LIKE '%United%'
ORDER BY C.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME ASC;

/*7: Recuperar o primeiro nome, o sobrenome e o email dos funcionários que trabalham em departamentos localizados na região = ‘Europe’*/
SELECT E.FIRST_NAME, E.LAST_NAME, E.EMAIL
FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
    INNER JOIN LOCATIONS L
    USING (LOCATION_ID)
    INNER JOIN COUNTRIES C
    USING (COUNTRY_ID)
    INNER JOIN REGIONS R
    USING (REGION_ID)
    WHERE REGION_NAME = 'Europe'
ORDER BY E.FIRST_NAME ASC;
