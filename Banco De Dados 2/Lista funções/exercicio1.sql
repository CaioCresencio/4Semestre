SET SERVEROUTPUT ON;
-- funcao auxiliar
CREATE OR REPLACE FUNCTION confere_historico(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS
    CURSOR emp_cursor IS
    SELECT employee_id, start_date,end_date 
    FROM job_history WHERE employee_id = empid;
    
    empid_job job_history.employee_id%TYPE;
    data_in job_history.start_date%TYPE;
    data_f job_history.end_date%TYPE;
    
    total NUMBER;
    aux NUMBER;
BEGIN
    total := 0;
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO empid_job, data_in,data_f;
        EXIT WHEN emp_cursor%NOTFOUND;
         
        aux := MONTHS_BETWEEN(data_f,data_in)/12;
       
        total := total+aux;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(total); 
    CLOSE emp_cursor;
    
    RETURN total;
END;
/
-- funcao principal
CREATE OR REPLACE FUNCTION mais_tempo_empresa 
(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS        
    anos_atual NUMBER;
    historico NUMBER;
    retorno NUMBER;
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(sysdate,hire_date)/12) INTO anos_atual
    FROM employees WHERE employee_id = empid;
    
    historico := confere_historico(empid); 
    
    retorno := TRUNC((anos_atual + historico),2);
    RETURN retorno;
    
END;
/

DECLARE 
    qtd NUMBER;
BEGIN
    qtd := mais_tempo_empresa(101);
    DBMS_OUTPUT.PUT_LINE (qtd || ' ' || 'ANOS NA EMPRESA');
END;
/
