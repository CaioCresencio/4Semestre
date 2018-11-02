
SET SERVEROUTPUT ON;

alter table employees_temp modify dangerousness number(8,2);
desc employees_temp;
    
CREATE OR REPLACE PROCEDURE periculosidade2
(
    nome_departamento departments.department_name%TYPE,
    nome_estado locations.state_province%TYPE
)
    
IS
    
    CURSOR emp_cursor IS
        SELECT employee_id
        FROM employees
        JOIN departments
        USING (department_id)
        JOIN locations
        USING (location_id)
        WHERE department_name = nome_departamento AND
        state_province = nome_estado;
        
    emp emp_cursor%ROWTYPE;
        
BEGIN 
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        UPDATE employees_temp SET dangerousness  = salary* 0.20
        WHERE employee_id = emp.employee_id;
        
       
        
    END LOOP;   

    CLOSE emp_cursor;
    
END;
/

DECLARE 

BEGIN
    periculosidade2('IT','Texas');
    
END;
/

select * from employees_temp;