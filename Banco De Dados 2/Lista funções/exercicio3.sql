-- função anterior
SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION emp_id
(
    empid employees.employee_id%TYPE
)
RETURN VARCHAR2
IS
    retorno VARCHAR2(4000);
    n NUMBER;

BEGIN
    SELECT TRUNC((MONTHS_BETWEEN(sysdate,hire_date)/12),0) INTO n
    FROM employees WHERE employee_id = empid;
    
    IF (n > 12) THEN
        retorno := 'master';
    ELSIF (n >= 8 and  n<= 12) THEN
        retorno := 'senior';
    ELSIF (n < 8) THEN
        retorno := 'pleno';
    END IF;
    
    RETURN retorno;
END;
/

-- PROCEDURE
CREATE OR REPLACE PROCEDURE aumento(
    empid employees.employee_id%TYPE
)
IS
    retorno VARCHAR2(400);
BEGIN
    retorno := emp_id(empid);
    IF (retorno = 'master') THEN
    
        UPDATE employees_temp SET salary = salary *1.10
        WHERE employee_id = empid;
        
    ELSIF (retorno = 'senior') THEN
        UPDATE employees_temp SET salary = salary *1.05
        WHERE employee_id = empid;
 
    END IF;
    commit;

END;
/

DECLARE

BEGIN
    aumento(136);
END;
/
select employee_id, hire_date, salary from employees_temp;

    