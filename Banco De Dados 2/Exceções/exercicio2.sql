SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE atualizarSalario 
    (id_empregado employees.employee_id%TYPE,
    salario employees.salary%TYPE)
   
IS
    maximo NUMBER;
    invalid_salary EXCEPTION;
    atual NUMBER;
BEGIN

    SELECT MAX(salary) INTO maximo
    FROM employees WHERE job_id = 
    (SELECT job_id FROM EMPLOYEES
    WHERE employee_id = id_empregado);
    
    SELECT salary INTO atual
    FROM employees WHERE
    employee_id = id_empregado;
    
    IF salario > maximo THEN
        RAISE invalid_salary;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Passou');
    END IF;
    EXCEPTION 
        WHEN invalid_salary THEN
            DBMS_OUTPUT.PUT_LINE('Erro');
        
END;
/

DECLARE 
BEGIN
    atualizarSalario(100,24000);
END;
/
    
    SELECT * FROM employees;
