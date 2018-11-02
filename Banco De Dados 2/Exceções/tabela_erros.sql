SET SERVEROUTPUT ON ;

CREATE TABLE errors(
    
    e_date date,
    error_code NUMBER,
    error_msg VARCHAR2(255));
    
    
DECLARE
    overflow_numero EXCEPTION;
    PRAGMA EXCEPTION_INIT(overflow_numero,-01438);
    
    numero NUMBER;
    sql_code NUMBER;
    sql_errm VARCHAR2(255);
    
BEGIN
    INSERT INTO departments 
    (department_id, department_name,manager_id,location_id) VALUES
    (111111111111,'teste',120,14);
    
EXCEPTION
    WHEN overflow_numero THEN
        sql_code := sqlcode;
        sql_errm := sqlerrm;
        
        INSERT INTO errors(e_date,error_code,error_msg) VALUES (sysdate,sql_code,sql_errm);
        DBMS_OUTPUT.PUT_LINE('Overflow');
    
END;
/


SELECT * FROM errors;