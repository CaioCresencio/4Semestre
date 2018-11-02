SET SERVEROUTPUT ON

DECLARE
    CURSOR  emp_cursor IS
        SELECT employee_id, hire_date
        FROM employees;
    
    emp emp_cursor%ROWTYPE;
    total NUMBER;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp;
        EXIT WHEN emp_cursor%NOTFOUND;
        total := months_between(sysdate,emp.hire_date)/12;
        
        IF total> 15 THEN
            dbms_output.put_line('Senior' || ' ' || emp.employee_id || ' ' || emp.hire_date || ' ' || total );
        ELSIF total >= 13  THEN
            dbms_output.put_line('Pleno' || ' ' || emp.employee_id || ' ' || emp.hire_date);
        ELSE
            dbms_output.put_line('Junior' || ' ' || emp.employee_id || ' ' || emp.hire_date);
        END IF;
        
    END LOOP;
    CLOSE emp_cursor;
END;
/
        

DECLARE

    CURSOR emp_cursor IS
    SELECT employee_id, email
    FROM employees;
    
    emp emp_cursor%ROWTYPE;
    
BEGIN 
    OPEN emp_cursor;
    LOOP
        EXIT WHEN emp_cursor%NOTFOUND;
        FETCH emp_cursor INTO emp;
        dbms_output.put_line(emp.email || '@hr.com');
    END LOOP;
    CLOSE emp_cursor;
END;
/

CREATE TABLE retired_emps(
employee_id,
last_name,
job_id ,
hire_date,
retire_date ,
salary,
department_id) AS
SELECT employee_id,last_name,job_id,hire_date,sysdate,salary,department_id 
FROM employees;

drop table retired_emps;

DECLARE
    CURSOR emp_cursor IS
    SELECT employee_id,last_name,job_id,hire_date,sysdate,salary,department_id
    FROM employees;
    
    emp emp_cursor%ROWTYPE;
    
BEGIN 
    OPEN emp_cursor;
    LOOP
        EXIT WHEN emp_cursor%NOTFOUND;
        FETCH emp_cursor INTO emp;
        
        INSERT INTO retired_emps (employee_id,last_name,job_id,hire_date,retire_date,salary,department_id)
        values (emp.employee_id,emp.last_name,emp.job_id,emp.hire_date,emp.sysdate,emp.salary,emp.department_id);
    END LOOP;
END;
/
select  * from retired_emps;