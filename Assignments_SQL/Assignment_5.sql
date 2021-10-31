-- 1)
-- True 

-- 2) 
-- False

-- 3) 
-- True

-- 4) 
select round(max(salary), 0) as "Maximum",
       round(min(salary), 0) as "Minimum",
       round(sum(salary), 0) as "Sum",
       round(avg(salary), 0) as "Average"
from employees;

-- 5)
select job_id as "Job Title",
       round(max(salary), 0) as "Maximum",
       round(min(salary), 0) as "Minimum",
       round(sum(salary), 0) as "Sum",
       round(avg(salary), 0) as "Average"
from employees
group by job_id;

-- 6)
select job_id, count(*)
from employees
-- where job_id = '&job' 
group by job_id;

-- 7)
select count(distinct manager_id) as "No. of managers"
from employees;

-- 8)
select max(salary) - min(salary) as "The Difference"
from employees;

-- 9) 
Select manager_id, min(salary)
from employees 
where manager_id is not null 
group by manager_id 
having min(salary) > 6000 
order by min(salary) desc;

-- 10)
select count(*) as "No. of employees"
from employees
where hire_date like '%1995%'
   or hire_date like '%1996%'
   or hire_date like '%1997%'
   or hire_date like '%1998%';
-- not working properly    
   
-- 11)
select distinct job_id as "Job",
sum(case department_id when 20 then salary end) as "Dept 20",
sum(case department_id when 50 then salary end) as "Dept 50",
sum(case department_id when 80 then salary end) as "Dept 80",
sum(salary) as "Total"
from employees
group by job_id;
