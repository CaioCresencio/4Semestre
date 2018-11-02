--2.1--
select max(salary), min(salary),avg(salary) from 
employees 
group by(job_id);
--2.2--
select g.last_name, count(e.employee_id)
from employees g, employees e
where g.employee_id = e.manager_id
group by(g.last_name);

--2.3--
select job_id, avg(salary)
from employees 
group by (job_id)
having avg(salary) > 5000;

--2.4--
select max(salary) - min(salary) from 
employees e 
join departments
using(department_id)
join locations l
using(location_id)
group by l.city
having count(employee_id) > 10;

--2.5--
select count(employee_id), c.country_name from 
employees e 
join departments
using(department_id)
join locations l
using(location_id)
join countries c
using (country_id)
group by c.country_name,l.city
having count(employee_id) < 20;

--2.6--
select e.first_name, e.salary 
from employees e
where e.manager_id in (select g.employee_id
from employees g where g.last_name like 'King');

--2.7--
select e.first_name, e.salary from
employees e
where salary > (select avg(salary) from
    employees g
    join departments
    using (department_id)
    join locations
    using (location_id)
    join countries c
    using (country_id)
    where country_id like '%UK%');

--2.8--

select e.*
from employees e
where department_id = (select department_id 
                        from employees 
                        where email like 'JRUSSEL' and e.email not like 'JRUSSEL' );
                        
--2.9--

select e.* 
from employees e
join employees g
on e.department_id = g.department_id
where g.email like 'JRUSSEL' and
e.email not like 'JRUSSEL';

--2.10--
select last_name,employee_id, job_id 
from employees 
where salary < (select salary 
                from employees 
                where job_id like 'MK_MAN');
                
--2.11--
select last_name,employee_id, job_id 
from employees 
where salary > (select salary 
                from employees 
                where job_id like 'MK_MAN');
                
--2.12--
select e.* from employees e
where salary  = (select max(e2.salary)
from employees e2
where e2.hire_date between ('01-01-2002') and ('31-12-2003'));

--2.13--

select d.* from departments d                            
where exists (select e.*
from employees e
where e.department_id = d.department_id);

select d.* from departments d                            
where d.department_id  in (select e.department_id
from employees e);

--2.14--

select e.* from employees e
where e.employee_id in (
select d.manager_id from departments d);

select e.* from employees e                            
where exists (select d.*
from departments d
where e.employee_id = d.manager_id);

--2.15--
create view  view_dep (Nome_dep,total_employees)
as (select d.department_name, count(e.employee_id)
from departments d
join employees e
using (department_id)
group by d.department_name);


--2.16--

create view  view_dep (Nome_dep,total_employees)
as (select d.department_name, count(e.employee_id)
from departments d
join employees e
using (department_id)
group by d.department_name
having count(e.employee_id) > 2);

--2.17--

create view dep1 (Regiao, total) as (
select r.region_name, count(e.employee_id)
from employees e
join departments
using (department_id)
join locations
using(location_id)
join countries
using(country_id)
right join regions r
using (region_id)
group by (r.region_name));



--2.18--

select r.region_name, e.job_id,count(e.employee_id )
from employees e
join departments
using (department_id)
join locations
using(location_id)
join countries
using(country_id)
join regions r
using (region_id)
group by (r.region_name,e.job_id)
order by r.region_name , e.job_id ;
