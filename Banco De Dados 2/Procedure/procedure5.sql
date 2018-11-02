SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE teste(
    departamento departments.department_id%TYPE
    )
IS
    CURSOR emp_cursor IS
        SELECT employee_id,last_name,job_title,salary,department_id
        FROM employees_temp 
        JOIN jobs j
        USING (job_id)
        WHERE employee_id IN (SELECT manager_id 
                            FROM departments);
    
        emp emp_cursor%ROWTYPE;
BEGIN 
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp.employee_id || ' gerencia: ' || emp.department_id);
        
    END LOOP;
    CLOSE emp_cursor;
END;
/

DECLARE
    numero NUMBER;
BEGIN
    numero := &numero;
    teste(10);
END;
/