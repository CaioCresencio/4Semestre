
create table emp (
emp_id int not null,
nome varchar(20),
salario float,
constraint chave_emp primary key(emp_id));

create sequence seq_emp 
start with 1
increment by 1
maxvalue 99
nocycle;

select sequence seq_emp;

create view view_emp 
as (select nome, salario from emp);


grant select, update
on usuario1.emp
to user user1;

grant select 
on user1.emp
to usuario3;

grant insert
on user1.emp
to usuario3;

grant update(salario)
on user1.emp
to usuario3;

drop table emp;

grant select
on user1.emp
to public;

