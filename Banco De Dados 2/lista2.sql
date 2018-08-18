-- 1--

select e.last_name, e.salary, j.job_title, d.department_name
from employees e
join jobs j 
using(job_id)
join departments d
using (department_id)
join locations
using (location_id)
where city like 'Toronto';

--2--  

select e.first_name, e.last_name, d.department_name, j.job_title, h.start_date, h.end_date
from employees e, departments d, jobs j
join job_history h
using (job_id)
where e.employee_id = h.employee_id and e.department_id  = d.department_id 
order by e.first_name, e.last_name asc;

--3--

select e.first_name , e.last_name, j.job_title, h.start_date, h.end_date
from employees e
join job_history h
using(job_id)
join jobs j
using (job_id)
where e.employee_id = h.employee_id;

--4--

select d.department_name, g.first_name || ' ' || g.last_name Nome
from departments d left outer join employees g
on d.manager_id = g.employee_id;

--5--

select r.region_name, d.department_name
from departments d
join locations l
using (location_id)
join countries c
using (country_id)
right outer join 
regions r
using(region_id);

--6--
select max(salary), min(salary), trunc(avg(salary),2) 
from employees 
group by job_id;

--7--

select g.last_name, count(e.manager_id)
from employees g, employees e
where g.employee_id = e.manager_id
group by g.last_name;

--8--
select avg(salary), count(employee_id)
from employees 
group by job_id
having avg(salary) > 5000;


--9--
select e.first_name || ' ' || e.last_name, e.hire_date
from employees e
where e.department_id = (select department_id
from employees 
where last_name like 'Zlotkey') and e.last_name <> 'Zlotkey';

--10--
select e.employee_id, e.last_name 
from employees e, employees e2
where e.department_id = e2.department_id and e2.last_name like '%J%'
;
--11--
select e.last_name,e.hire_date
from employees e
where e.hire_date < (select hire_date
from employees 
where employee_id = e.manager_id);
--12--
select e.last_name,e.salary
from employees e
where salary > (select max(salary) 
from employees 
join departments 
using(department_id)
join locations
using (location_id)
join countries
using (country_id)
join regions
using (region_id)
where region_name like '%Europe%');

--13--
select e.first_name || '' || e.last_name Nome
from employees e
where employee_id in (select manager_id 
from employees 
where manager_id <> e.employee_id);

--14--
select r.region_name 
from regions r
where  exists (select region_id
from regions 
join countries
using (region_id)
join locations 
using (country_id)
join departments 
using (location_id)
where r.region_id = region_id);
--15--
select c.country_name 
from countries c
where not exists (select country_id
from countries 
join locations 
using (country_id)
join departments 
using (location_id)
where c.country_id = country_id);
