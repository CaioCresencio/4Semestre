
SET SERVEROUTPUT ON

DROP TABLE dept_temp;
CREATE TABLE dept_temp AS
    SELECT * FROM hr.departments;
    
    
DECLARE
    dept_no departments.department_id%TYPE := 50;

BEGIN
    DELETE FROM dept_temp
    WHERE department_id = dept_no;
    
    IF SQL%FOUND THEN
        dbms_output.put_line('Remoção bem sucedidade do departmento' || dept_no);
    ELSE
        dbms_output.put_line('Não existe departamento'||dept_no);
    END IF;
END;
/
