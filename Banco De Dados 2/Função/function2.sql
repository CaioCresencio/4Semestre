
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION tempo_empresa 
(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS        
    qtd NUMBER;
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(sysdate,hire_date)/12,0) INTO 
    qtd FROM employees WHERE employee_id = empid;
    RETURN qtd;
END;
/

DECLARE 
    teste NUMBER;
    qtd NUMBER;
BEGIN
    teste := &teste;
    qtd := tempo_empresa(teste);
    DBMS_OUTPUT.PUT_LINE('ANOS:' || '' || qtd);
END;
/

select hire_date, employee_id from employees where employee_id = 100;



CREATE OR REPLACE FUNCTION mais_tempo_empresa 
(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS        
    qtd NUMBER;
BEGIN
    select count(e.employee_id) INTO qtd
    from employees e, employees g
    WHERE e.hire_date < g.hire_date and g.employee_id = empid;
    RETURN qtd;
END;
/

DECLARE 
    teste NUMBER;
    qtd NUMBER;
BEGIN
    teste := &teste;
    qtd := mais_tempo_empresa(teste);
    DBMS_OUTPUT.PUT_LINE (qtd || ' ' || 'COM MAIS TEMPO DE EMPRESA');
END;
/


select e.hire_date
from employees e, employees g
WHERE e.hire_date < g.hire_date and g.employee_id = 100;

select * from job_history;
