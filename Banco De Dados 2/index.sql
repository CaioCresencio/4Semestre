create index emp_last_name_idx on employees (last_name);
select * from employees where last_name = 'King';

--LISTA DE DE INDEX--




--1--
    create table emp_test (
    employee_id int primary key,
    last_name varchar(20) not null,
    manager_id int,
    department_id int,
    [constraint emp_test_dep]
    foreign key (department_id)
    references departments (department_id)
    on delete cascade
    );
    
--2--
    create sequence sequence_test
    start with 1
    increment by 1
    maxvalue 9999
    nocycle;
    
    insert into emp_test (employee_id,last_name,manager_id,department_id) values
    (sequence_test.nextval,'teste',100,10);