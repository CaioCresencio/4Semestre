SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION bonus_func
    (id_emp employees.employee_id%TYPE)
RETURN NUMBER
IS
    qtd NUMBER;
    dif NUMBER;
BEGIN
    qtd := 0;
    SELECT (MONTHS_BETWEEN(sysdate,hire_date))/12 INTO dif
    FROM employees WHERE employee_id = id_emp;
   
    IF dif >= 10 THEN
        qtd := TRUNC(dif,0) * 50;
    END IF;
    
    RETURN qtd;
END;
/

DECLARE 
    teste NUMBER;
BEGIN
    teste := bonus_func(100);
    DBMS_OUTPUT.PUT_LINE('Ele possui um bonus de : '|| teste);
END;
/

SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;