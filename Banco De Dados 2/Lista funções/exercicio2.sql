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
DECLARE
    empid NUMBER;
BEGIN
    empid := 164;
    DBMS_OUTPUT.PUT_LINE(emp_id(empid));
END;
/
select employee_id, hire_date from employees;
