set SERVEROUTPUT ON
DECLARE 
    TYPE emp IS RECORD(
        emp_id employees.employee_id%TYPE,
        sobrenome employees.last_name%TYPE,
        jobs employees.job_id%TYPE,
        hire_date employees.hire_date%TYPE,
        retire_date  date,
        salary employees.salary%TYPE,
        department employees.department_id%TYPE);
        
        empregado emp;
        emp_id employees.employee_id%type := 100;    
BEGIN
    select employee_id,last_name,job_id,hire_date,salary,department_id into empregado 
    from employees
    where employee_id = emp_id;

END;
/

set SERVEROUTPUT ON
DECLARE 
    emp_dados retired_emps%ROWTYPE;
BEGIN
    select employee_id, last_name, job_id,hire_date,SYSDATE,salary,department_id
    into empregado
    from employees
    where employee_id = 100;
    
    insert into retired_emps
    values emp_dados;
END;
/
drop table retired_emps;
select * from retired_emps;

create table retired_emps (
employee_id int primary key,
last_name varchar(20),
job_id varchar(20),
hire_date date,
retire_date date default sysdate,
salary float,
department_id int);
