SET SERVEROUTPUT ON;

-- USANDO O JOB_HISOTRY
CREATE OR REPLACE FUNCTION mais_tempo_empresa2 
(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS        
    qtd NUMBER;
    CURSOR emp_cursor IS
    SELECT employee_id,hire_date, MIN(start_date)
    FROM employees
    LEFT JOIN job_history 
    USING (employee_id)
    ORDER BY employee_id;
    
    emp
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

select count(*) from employees

 