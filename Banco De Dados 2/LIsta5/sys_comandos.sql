--1.1--
create user hr_dependents identified by hr default tablespace users
quota 5m on users
temporary tablespace temp;

grant create session
to hr_dependents;

grant create table
to hr_dependents;

grant create view 
to hr_dependents;

grant create sequence 
to hr_dependents;

grant select, references
on hr.employees
to hr_dependents;

grant select, references
on hr.jobs
to hr_dependents;

grant select, references
on hr.departments
to hr_dependents;



--

