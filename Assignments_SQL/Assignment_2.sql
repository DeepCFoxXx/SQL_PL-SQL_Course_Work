--1)
select last_name, salary
from employees
where salary >12000;

--2) 
select last_name, department_id
from employees
where employee_id = 176;

--3)
select last_name, salary
from employees
where salary >12000 or salary <5000;

--4)
select last_name, job_id, hire_date
from employees
where last_name='Matos' or last_name='Taylor'
order by hire_date;

--5) 
select last_name, department_id
from employees
where department_id in (20,50)
order by last_name;

--6)
select last_name "Employee", salary "Monthly Salary"
from employees
where (salary between 5000 and 12000) and department_id in (20,50);

--7)
select last_name, hire_date
from employees
where hire_date like '%94';

--8)
select last_name, job_id
from employees
where manager_id is null;

--9)
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary, commission_pct;
 
--10) 
select last_name, salary
from employees
where salary> &Salary;

--11)
select employee_id, last_name, salary, department_id
from employees
where manager_id= &manager
order by last_name;

--12)
select last_name
from employees
where last_name like '__a%';

--13) 
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';

--14)
select last_name, job_id, salary
from employees
where job_id='SA_REP' or job_id='ST_CLERK' and salary = 2500 or salary = 3500 or salary = 7000;

--15)
select last_name "Employee", salary "Monthly Salary", commission_pct
from employees
where commission_pct=.2;