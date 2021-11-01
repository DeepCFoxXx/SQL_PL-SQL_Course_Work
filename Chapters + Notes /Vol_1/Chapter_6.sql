select department_id, department_name, location_id, street_address, city
from departments
natural join locations;

select employee_id, first_name, last_name, department_id, manager_id, department_name
from employees
natural join departments
order by 1;

desc employees;

desc departments;

select employee_id, first_name, last_name, department_id, department_name
from employees join departments
using (department_id);

select employee_id, first_name, last_name, phone_number, department_id, department_name, location_id
from employees join departments
using (department_id);

select employee_id, first_name, last_name, phone_number, department_id,
       -- employees.department_id as "Employees Department",
       department_name, employees.manager_id as "Employees Manager",
       location_id, departments.manager_id as "Departments Manager"
from employees join departments
using (department_id)
order by department_id;

select employee_id, first_name, last_name, phone_number, department_id, department_name, location_id,
       e.manager_id as "Employees Manager",
       d.manager_id as "Departments Manager"
from employees e join departments d
using (department_id)
order by department_id;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE location_id = 1700;

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

select e.employee_id, e.last_name, d.department_name, e.manager_id
from employees e join departments d
on e.department_id = d.department_id;

select e.employee_id, e.last_name, d.department_name, city
from employees e join departments d
using (department_id)
join locations
using (location_id);

select e.employee_id, e.last_name, d.department_name, city
from employees e join departments d
on (e.department_id = d.department_id)
join locations
on departments.location_id = locations.location_id;

select e.employee_id, e.last_name, d.department_name, city
from employees e join departments d
using (department_id) join locations
using (location_id) join countries
using (country_id);

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id, e.manager_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
AND e.manager_id = 149 ;

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id, e.manager_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
WHERE e.manager_id = 149 ;

select departments.department_id, department_name, first_name, last_name
from departments join employees
on departments.department_id = employees.employee_id;
 
select w.employee_id as worker_id,
       w.first_name as worker_first, w.last_name as worker_last,
       m.employee_id as mangaer_id,
       m.first_name as manager_first, m.last_name as manager_last
from employees w join employees m
on w.manager_id = m.employee_id
order by 1;

select * from job_grades;

drop table job_grades;

select e.first_name, e.last_name, e.salary, grade_level
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
order by 4 desc;

desc job_grades;

select employee_id, last_name, department_name
from employees e  left outer join departments d
using (department_id)
order by 1;

select employee_id, last_name, department_name
from employees e  left outer join departments d
on  e.department_id = d.department_id
order by 1;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e  right outer join departments d
on  e.department_id = d.department_id
order by 1;

select count(distinct department_id)
from employees;

select e.employee_id, e.last_name, e.department_id, d.department_name
from departments d  right outer join  employees e
on  e.department_id = d.department_id
order by 1;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e  full outer join departments d
on  e.department_id = d.department_id
order by 1;

SELECT last_name, department_name
FROM employees
CROSS JOIN departments;

•Equijoin
•Nonequijoin
•Outer join
•Self-join