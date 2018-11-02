SET SERVEROUTPUT ON;

DECLARE  
    invalid_department EXCEPTION;
    name VARCHAR(20) := '&name';
    deptno NUMBER := &deptno;
    
BEGIN 
    UPDATE departments SET department_name = name
    WHERE department_id = deptno;
    IF SQL%NOTFOUND THEN
        RAISE invalid_department;
    END IF;
EXCEPTION
    WHEN invalid_department THEN
    DBMS_OUTPUT.PUT_LINE('Não existe o department id informado');
END; 
/
