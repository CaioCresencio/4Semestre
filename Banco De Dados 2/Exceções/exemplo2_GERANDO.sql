SET SERVEROUTPUT ON;

DECLARE 
    insert_excep EXCEPTION; 
    PRAGMA EXCEPTION_INIT(insert_excep,-01400);
BEGIN
    INSERT INTO departments
    (department_id,department_name)
    VALUES (280,NULL);
EXCEPTION
    WHEN insert_excep THEN
        DBMS_OUTPUT.PUT_LINE('Erro na inserção nula');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
    
END;
/
