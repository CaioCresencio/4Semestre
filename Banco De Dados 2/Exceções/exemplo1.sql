SET SERVEROUTPUT ON;

DECLARE

    lname varchar2(20);
    
BEGIN

    SELECT last_name INTO lname
    FROM employees
    WHERE first_name = 'Caio';
    
    DBMS_OUTPUT.PUT_LINE(lname);
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('O comando SELECT INTO recuperou muitas tuplas. Considere o uso de um cursor.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
