/*1: Recuperar o primeiro nome e o sobrenome dos funcionários com salário maior que 5000*/
  SELECT FIRST_NAME, LAST_NAME 
    FROM EMPLOYEES
   WHERE SALARY > 5000
ORDER BY SALARY ASC;

/*2: Recuperar o primeiro nome e o sobrenome dos funcionários cujos salários estejam dentro da faixa de 8000 a 10000*/
  SELECT FIRST_NAME, LAST_NAME
    FROM EMPLOYEES
   WHERE SALARY BETWEEN 8000 AND 10000
ORDER BY SALARY ASC;

/*3: Recuperar os títulos dos cargos (job_title) cujos salários estejam dentro da faixa de 4000 a 10000*/
  SELECT JOB_TITLE 
    FROM JOBS
   WHERE MIN_SALARY >= 4000 AND MAX_SALARY <= 10000
ORDER BY MIN_SALARY;

/*4: Recuperar o sobrenome, telefone e o email dos funcionários com job_title = ‘Programmer’*/
  SELECT LAST_NAME, PHONE_NUMBER, EMAIL
    FROM EMPLOYEES
   WHERE JOB_ID = (SELECT JOB_ID FROM JOBS WHERE JOB_TITLE = 'Programmer';)
ORDER BY LAST_NAME ASC;

/*5: Recuperar o primeiro nome e o sobrenome dos funcionários dos departamentos com nome ‘Sales’ ou ‘Marketing’*/
  SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
    FROM EMPLOYEES E, DEPARTMENT D,
   WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
     AND (D.DEPARTMENT_NAME = 'Sales' OR D.DEPARTMENT_NAME = 'Marketing')
ORDER BY DEPARTMENT_NAME, FIRST_NAME ASC;

/*6: Para cada departamento, recuperar o nome do departamento e o sobrenome do seu gerente*/
  SELECT D.DEPARTMENT_NAME, E.LAST_NAME
    FROM DEPARTMENTS D, EMPLOYEES E,
   WHERE D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_NAME ASC;

/*7: Para cada departamento, recuperar o nome do departamento e sua cidade*/
  SELECT D.DEPARTMENT_NAME, L.CITY
    FROM DEPARTMENTS D, LOCATIONS L
   WHERE D.LOCATION_ID = L.LOCATION_ID
ORDER BY D.DEPARTMENT_NAME ASC;

/*8: Para cada departamento, recuperar o nome do departamento, sua cidade e o nome do país*/
  SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
    FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
   WHERE D.LOCATION_ID = L.LOCATION_ID AND L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY D.DEPARTMENT_NAME ASC;

/*9: Para cada departamento, recuperar o nome do departamento, sua cidade e o nome do país, para países que contenham ‘United’ no nome*/
  SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
    FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C,
   WHERE D.LOCATION_ID = L.LOCATION_ID 
     AND L.COUNTRY_ID = C.COUNTRY_ID 
     AND C.COUNTRY NAME LIKE '%United%'
ORDER BY C.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME ASC;

/*10: Recuperar o primeiro nome, o sobrenome e o email dos funcionários que trabalham em departamentos localizados na região = ‘Europe’*/
  SELECT E.FIRST_NAME, E.LAST_NAME, E.EMAIL
    FROM EMPLOYEES E, DEPARTMENT D, LOCATION L, COUNTRY C, REGION R
   WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
     AND D.LOCATION_ID = L.LOCATION_ID
     AND L.COUNTRY_ID = C.COUNTRY_ID
     AND C.REGION_ID = R.REGION_ID
     AND R.REGION_NAME = 'Europe'
ORDER BY E.FIRST_NAME ASC;