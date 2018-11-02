SET SERVEROUTPUT ON;

    

CREATE OR REPLACE PROCEDURE periculosidade
    
IS
    CURSOR emp_cursor IS
        SELECT employee_id,  first_name, last_name,
        department_name, salary, state_province
        FROM employees
        JOIN departments
        USING (department_id)
        JOIN locations
        USING (location_id)
        WHERE department_name = 'IT' AND
        state_province = 'Texas';
        
    emp emp_cursor%ROWTYPE;
        
BEGIN 
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        UPDATE employees_temp SET salary = salary * 1.20
        WHERE employee_id = emp.employee_id;
        
        emp.salary := emp.salary*1.20;
        
    END LOOP;   
    commit;
    CLOSE emp_cursor;
    
    
END;
/

DECLARE 

BEGIN
    periculosidade;
    
END;
/

DROP PROCEDURE periculosidade;
 