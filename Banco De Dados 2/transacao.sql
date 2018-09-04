create table temp as (select 
* from hr.employees);

select salary from temp;
 
select * from temp
where employee_id in (100,110);

update temp 
set salary = salary -100
where employee_id = 100;

update temp
set salary = 20000;

update temp set salary=7000
where last_name = 'Banda';

savepoint after_banda_salary;

update temp
set salary = 12000
where last_name = 'Greene';

savepoint after_greene_salary;

update temp
set salary = 10000
where last_name = 'Greene' or last_name ='Banda';

select salary from temp
where last_name in ('Banda','Greene');


rollback to savepoint after_banda_salary;

commit;