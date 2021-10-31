 --1)
 select last_name, job_id, salary as Sal  
 from employees; 
 -- True
 
 --2) 
 select *   
 from job_grades;
 -- False 
 
 --3) 
select employee_id, last_name  sal x 12  ANNUAL SALARY  
from employees; 
 -- 2 missing commas after last_name and sal x 12 
 -- sal has not been aliased and does not exist 
 -- x is not a mathmatical operator 
 -- ANNUAL SALARY has not been aliased and does not exist  
select
 employee_id,
 last_name,
 salary *12 as "ANNUAL SALARY" 
from
employees;

--4)
select * from DEPARTMENTS;

desc DEPARTMENTS;

--5)
select * from EMPLOYEES;

desc EMPLOYEES;

--6)
-- ??? "Tested working against main DB connection" ??

--7) 
select distinct  job_id 
from employees

--8)
select
 employee_id as "EMP #",
 last_name as "Employee",
 job_id as "Job",
 hire_date as "Hire Date"
from employees
order by employee_id desc;

--9)
select last_name||', '||job_id "Employee and Title" 
from employees;
 
--10) 
select employee_id||','||first_name||','|| last_name||','||email||','||phone_number||','||hire_date||','||job_id||','||salary||','||commission_pct the_output 
from employees;