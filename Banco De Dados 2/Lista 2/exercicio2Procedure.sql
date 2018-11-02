SET SERVEROUTPUT ON;

ALTER TABLE dept ADD total_salary NUMBER;

CREATE OR REPLACE PROCEDURE procedure_total_salary


IS
    CURSOR dept_cursor IS
    SELECT department_id FROM 
    dept;

    dept1 dept_cursor%ROWTYPE;
    
    n NUMBER;
BEGIN
    OPEN dept_cursor;
        LOOP 
            FETCH dept_cursor INTO dept1;
            EXIT WHEN dept_cursor%NOTFOUND;
            
            
            n := 0;
            
            SELECT SUM(salary) INTO n FROM emp
            WHERE department_id = dept1.department_id;
           
            UPDATE  dept SET total_salary = n 
            WHERE department_id = dept1.department_id;
        END LOOP;
    CLOSE dept_cursor;
    
            
END;
    
/
DECLARE  

BEGIN
    procedure_total_salary;
END;
/
SELECT * FROM dept;
SELECT total_salary FROM dept WHERE department_id = 90;
UPDATE emp SET salary = 200000 WHERE employee_id = 101;
select * from emp;

CREATE OR REPLACE TRIGGER atualiza_dept 
    AFTER UPDATE OF salary ON hr.emp
BEGIN
    CASE
        WHEN UPDATING THEN
            procedure_total_salary;
    END CASE;
END;
/
