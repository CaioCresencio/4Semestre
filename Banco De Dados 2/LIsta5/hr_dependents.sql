--1.2--
create sequence sequence_dependents 
start with 1
nocycle 
increment by 1;


create table dependents (
dependent_id int not null primary key,
nome varchar(20) not null,
data_nasc date not null,
parentesco varchar(20) default 'Filho',
employee_id int not null,
foreign key (employee_id) references hr.employees (employee_id) on delete cascade);

--1.3--    
create view hr_dependents_view (employee_id,primeiro_nome,ultimo_nome,titulo,departamento,nome,parentesco,data_nascimento) as(
    select employee_id,e.first_name,e.last_name, j.job_title, d.department_name, p.nome,p.parentesco,p.data_nasc
    from dependents p
    join hr.employees e
    using(employee_id)
    join hr.jobs j
    using (job_id)
    join hr.departments d
    using (department_id)
    );

select * from hr_dependents_view;
    
