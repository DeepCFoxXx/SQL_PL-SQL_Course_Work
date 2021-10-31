-- 1)
SELECT last_name, TO_CHAR(hire_date,'DD-MON-YYYY') AS "Hire Date"
FROM   employees a
JOIN (Select department_id from employees where last_name = :surname) b on a.department_id = b.department_id
and last_name <> :surname;

-- 2)
select avg(salary)
from employees;

select employee_id, last_name, salary 
from employees 
where salary > (select avg(salary) from employees) 
order by 3; 

-- 3)
select employee_id, last_name 
from employees 
where department_id in (select department_id from employees where last_name like '%u%'); 

-- 4)
select last_name, department_id, job_id
from employees
where department_id in (select department_id from departments where location_id =1700);

select last_name, department_id, job_id
from employees
where department_id in (select department_id from departments where location_id = :location);

-- 5)
select last_name, salary 
from employees 
where manager_id = (select employee_id from employees where last_name = 'King'); 

-- 6)
select department_id, last_name, job_id 
from employees 
where department_id in (select department_id from departments where department_name = 'Executive'); 

-- 7)
select last_name 
from employees 
where salary > any (select salary from employees where department_id = 60);

-- 8)
select employee_id, last_name, salary 
from employees where department_id in (select department_id from employees where last_name like '%u%') 
and salary > (select avg(salary) from employees); 