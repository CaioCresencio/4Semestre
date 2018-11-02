set SERVEROUTPUT ON
DECLARE
    --job_id varchar(20) := UPPER(&job_id);
    emp_job employees.job_id%TYPE;
    salario employees.salary%TYPE;
BEGIN 
    
    SELECT job_id INTO emp_job
    FROM employees
    where employee_id = 140;
    
    CASE 
        WHEN emp_job = 'PU_CLERK' THEN
            --UPDATE employees SET salary = salary*1.12 
            --WHERE employee_id = 140;
        DBMS_OUTPUT.PUT_LINE('Caso 1');
        WHEN emp_job = 'SH_CLERK' THEN
            --UPDATE employees SET salary = salary*1.11 
            --WHERE employee_id = 140;
            DBMS_OUTPUT.PUT_LINE('Caso 2');
        WHEN emp_job = 'ST_CLERK' THEN
            --UPDATE employees SET salary = salary*1.10 
            --WHERE employee_id = 140;
            DBMS_OUTPUT.PUT_LINE('Caso 3');
        ELSE 
           -- UPDATE employees SET salary = salary*1.05 
            --WHERE employee_id = 140;
            DBMS_OUTPUT.PUT_LINE('Caso 4');
    END CASE;
    SELECT salary INTO salario
    FROM employees
    WHERE employee_id = 140;
    
    DBMS_OUTPUT.PUT_LINE(salario);
END;
/
set SERVEROUTPUT ON
DECLARE 
    nota CHAR(1) := UPPER('&nota');
    resultado VARCHAR(40);

BEGIN
    
    IF nota ='A' OR nota = 'B' THEN
        resultado := 'Aprovado - Excelente';
    ELSIF nota = 'C' THEN
        resultado := 'Aprovado - Bom';
    ELSIF nota IN ('D', 'E') THEN
        resultado := 'Reprovado';
    ELSE
        resultado := 'Nota inválida';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Resultado = ' || resultado);
    DBMS_OUTPUT.PUT_LINE('Nota = ' || nota);
END;
/