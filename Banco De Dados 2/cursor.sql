SET SERVEROUT ON
-- SELECT IS funciona apenas com retorno de uma linha, caso contrario retorna uam excessão 
DECLARE 

    CURSOR emp_cursor IS
        SELECT employee_id, hire_date, salary
        FROM employees
        WHERE department_id = 60;
     
    dept_id departments.department_id%TYPE := &dept_id;
    
    CURSOR emp_cursor2 IS
    SELECT *
    FROM employees
    WHERE department_id = dept_id;
    
    empno employees.employee_id%TYPE;
    hdate employees.hire_date%TYPE;
    sal employees.salary%TYPE;
    
    
BEGIN
    OPEN emp_cursor;
    LOOP
    
        FETCH emp_cursor INTO empno , hdate, sal;
        EXIT WHEN emp_cursor%NOTFOUND;
        dbms_output.put_line(empno || ' ' || hdate || ' ' || sal);
    
    END LOOP;
    CLOSE emp_cursor;
END ;
/
    
    -- EXERCICIO 1
DECLARE
    CURSOR emp_cursor IS
    SELECT last_name, job_id
    FROM employees
    WHERE job_id like '%CLERK%' ;
    
    sobrenome employees.last_name%TYPE;
    titulo employees.job_id%TYPE;

BEGIN 
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO sobrenome,titulo;
        EXIT WHEN emp_cursor%NOTFOUND;
        dbms_output.put_line(sobrenome || ' ' || titulo);
    END LOOP;
    CLOSE emp_cursor;
END;
/    

DECLARE 
    CURSOR emp_cursor IS
    SELECT e.last_name, job_title
    FROM employees e
    join jobs 
    using(job_id)
    WHERE manager_id = 100
    ORDER BY last_name ASC;
    
    sobrenome employees.last_name%TYPE;
    titulo jobs.job_title%TYPE;
    
    
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO sobrenome,titulo;
        EXIT WHEN emp_cursor%NOTFOUND OR emp_cursor%ROWCOUNT >  5;
        dbms_output.put_line(sobrenome || ' ' || titulo); 
       
    END LOOP;
END;
/

DECLARE
    CURSOR ge_cursor IS
    SELECT g.last_name, d.department_name, g.salary, g.salary*1.05 as atualizado
    FROM  employees g 
    JOIN departments d
    using(department_id)
    where g.employee_id = d.manager_id;
    
    gerente ge_cursor%ROWTYPE;
BEGIN
    OPEN ge_cursor;
    LOOP
        FETCH ge_cursor INTO  gerente.last_name, gerente.department_name,
        gerente.salary, gerente.atualizado;
        EXIT WHEN ge_cursor%NOTFOUND ;
        dbms_output.put_line(gerente.last_name || ' ' || gerente.department_name || ' ' || gerente.salary ||  ' ' ||  gerente.atualizado);
    END LOOP;
    CLOSE ge_cursor;
END;
/
CREATE TABLE employees_temp AS
SELECT * FROM employees;

drop table employees_temp;
DECLARE
    CURSOR temp_cursor IS
    SELECT employee_id, job_id, salary
    FROM employees_temp;
    temp temp_cursor%ROWTYPE;
BEGIN 
   
   OPEN temp_cursor;
   LOOP
        FETCH temp_cursor INTO tem.employee_id, temp.job_id;
        EXIT WHEN temp_cursor%NOTFOUND;
        CASE 
            WHEN temp.job_id = 'PU_CLERK' THEN
                UPDATE employees_temp SET salary = salary*1.12
                WHERE employee_id = temp.employee_id;
                DBMS_OUTPUT.PUT_LINE(temp.salary);
            WHEN temp.job_id = 'SH_CLERK' THEN
                UPDATE employees_temp SET salary = salary*1.11 
                WHERE employee_id = temp.employee_id;
                DBMS_OUTPUT.PUT_LINE(temp.salary);
            WHEN temp.job_id = 'ST_CLERK' THEN
                UPDATE employees_temp SET salary = salary*1.10 
                WHERE employee_id = temp.employee_id;
                DBMS_OUTPUT.PUT_LINE(temp.salary);
            ELSE 
                UPDATE employees_temp SET salary = salary*1.05; 
                
                DBMS_OUTPUT.PUT_LINE(temp.salary);
        END CASE;
    END LOOP;
   
END;
/