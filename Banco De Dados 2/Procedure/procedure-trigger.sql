CREATE TABLE dept AS (SELECT * FROM departments);


CREATE OR REPLACE PROCEDURE add_dept_manager(
    dept_name dept.department_name%TYPE,
    mgr_id IN employees.employee_id%TYPE)
IS
    --variaveis locais
    
BEGIN 
    UPDATE dept
    SET manager_id = mgr_id
    WHERE UPPER(department_name) = UPPER(dept_name);
END;
/


SELECT * FROM dept
WHERE UPPER(department_name)  = 'IT SUPPORT';

BEGIN 
    add_dept_manager('IT SUPPORT', 100);
END;
/

select  * from dept where manager_id = 100;

SET SERVEROUT ON
CREATE OR REPLACE PROCEDURE P  
(
    A INTEGER,
    B IN INTEGER,
    C OUT INTEGER,
    D IN OUT FLOAT
)
    
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('DENTRO DO PROCEDIMENTO P');
    DBMS_OUTPUT.PUT_LINE('IN A = ' || A);
    DBMS_OUTPUT.PUT_LINE('IN B = ' || B);
    DBMS_OUTPUT.PUT_LINE('OUT  C = ' || C);
    DBMS_OUTPUT.PUT_LINE('IN OUT = ' || D);
    
END;
/
