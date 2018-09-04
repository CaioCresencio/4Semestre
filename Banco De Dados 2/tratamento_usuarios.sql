create user user1
identified by abc
default tablespace users quota 10m 
on users temporary tablespace temp;

grant create session to user1;

create user usuario1
identified by usuario1
default tablespace users
quota 5m
on users temporary tablespace temp;

grant create session to usuario1;

create user usuario2
identified by usuario2
default tablespace users
quota 5m
on users temporary tablespace temp;

grant create session to usuario2;


create user usuario3
identified by usuario3
default tablespace users
quota 5m
on users temporary tablespace temp;

grant create session to usuario3;


grant create session,
    create table,
    create sequence,
    create view
    to user1;
    
create table emp (
emp_id int not null,
nome varchar(20),
salario float,
constraint chave_emp primary key(emp_id));


select * from view_emp;

create role gerente;

grant create table,
    create sequence,
    create view
to gerente;

grant gerente
to user1;

grant select, update
on usuario1.emp
to user user1;

select *
from USER_SYS_PRIVS;


grant create table
to usuario3;

grant select
on hr.employees
to usuario3;

grant references
on hr.employees
to usuario3;

grant references
on user1.emp
to usuario3;

