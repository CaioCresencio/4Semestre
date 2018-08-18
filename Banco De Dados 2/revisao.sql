create table dept_copy as
select * from departments;

create table emp_copy as 
select * from employees;

select * from dept_copy;

create table dept_80 as
    select employee_id, last_name,
    salary*12 annual_salary,
    hire_date 
    from employees
    where department_id = 80;
    
select * from dept_80;

desc dept_80;

insert into dept_copy (department_id, department_name, manager_id, location_id)
values (998, 'Press',100,1700);


insert into dept_80 (employee_id, last_name, annual_salary, hire_date) 
    select employee_id, last_name, salary*12, hire_date
    from employees
    where department_id > 80;
    
update emp_copy
set commission_pct = 0.1 
where job_id = 'SH_CLERK';

select * from emp_copy;

update emp_copy
set job_id = (select job_id
    from employees 
    where employee_id = 205),
    department_id = (select department_id
    from departments 
    where department_name = 'Sales')
    where employee_id > 200;
    
delete from emp_copy
where department_id = 
    (select department_id 
    from departments
    where department_name like 'Sales');
    
    
truncate table emp_copy;
truncate table dept_copy;
drop table emp_copy;
drop table dept_copy;

create sequence sequencia_teste 
increment by 1
start with 1;
drop sequence sequencia_teste;

create sequence deptid_seq
    increment by 10
    start with 500 
    maxvalue 9999
    nocache
    nocycle;
    
insert into dept_copy (department_id,department_name,location_id)
values (deptid_seq.nextval,'Support',2500);

select * from dept_copy;

select deptid_seq.currval from dual;

alter sequence deptid_seq
increment by 5 
maxvalue 9999
cache 10
nocycle;

