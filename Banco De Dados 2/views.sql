
create view emp50_view
as select employee_id, last_name, salary
from employees 
where department_id = 50;

select * from emp50_view;

drop view emp50_view;


create view emp80_view (Nome, Salario)
    as select first_name || '' || last_name, salary
    from employees
    where department_id = 80;
    
select * from emp80_view;

create view emp_clerk_view  (Nome,Data_cont, Salario_anual)
    as select first_name || '' || last_name,hire_date,salary*12
    from employees
    where job_id like '%CLERK%';
    
select * from emp_clerk_view;

create or replace view emp50_view 
as select employee_id, last_name, email, department_id,
hire_date, job_id
from employees
where department_id = 50;

create or replace view emp_dept_view (nome, qtd_emp,min_sal,max_sal,avg_sal)
as select department_name, count(*), min(salary), max(salary), round(avg(salary),2)
    from employees join departments
    using (department_id)
    group by department_name;
    
select * from emp_dept_view;

create view dept_address_view (Departamento,Rua,Cidade,Codigo_p,Estado,País)
as select d.department_name,l.street_address,l.city,l.postal_code,l.state_province,c.country_name
    from departments d
    join locations l
    using(location_id)
    join countries c
    using(country_id);
    
insert into emp50_view (employee_id, last_name, email, department_id,
hire_date, job_id) values (123456,'caio','souza@email.com',100,sysdate,50);

select * from dept_address_view;