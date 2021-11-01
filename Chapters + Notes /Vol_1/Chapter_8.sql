SELECT employee_id, job_id
FROM   employees
UNION
SELECT employee_id, job_id
FROM   job_history;

SELECT employee_id, job_id, department_id
FROM   employees
UNION ALL SELECT employee_id, job_id, department_id
FROM   job_history
ORDER BY  employee_id;

SELECT employee_id, job_id
FROM   employees
UNION
SELECT employee_id, job_id
FROM   job_history
order by 1;

SELECT employee_id, job_id, hire_date, 'Current'
FROM   employees
UNION all
SELECT employee_id, job_id, start_date, 'Previous'
FROM   job_history
order by 1;

SELECT employee_id, job_id
FROM   employees
INTERSECT
SELECT employee_id, job_id
FROM   job_history
order by 1;

SELECT employee_id, job_id
FROM   employees
MINUS
SELECT employee_id, job_id
FROM   job_history
order by 1;

select distinct employee_id
from job_history;
 
SELECT employee_id
FROM   employees
MINUS
SELECT employee_id
FROM   job_history
order by 1;

select distinct(employee_id)
from job_history;

SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse location" 
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department", state_province
FROM locations;

select employee_id, job_id, 'Current' as "Current/Previous"
from employees
union all
select employee_id, job_id, 'Previous'
from job_history
order by 1;

select employee_id, job_id, hire_date, to_date('31-Dec-2099', 'dd-mon-yyyy')
from employees
union
select employee_id, job_id, start_date, end_date
from job_history
order by 3;

select employee_id, job_id, hire_date, '31-Dec-2999'
from employees
union
select employee_id, job_id, start_date, to_char(end_date, 'dd-mon-yyyy')
from job_history
order by 3;

select employee_id, job_id, hire_date as START_DATE, 'Current Job' as END_DATE
from employees
union
select employee_id, job_id, start_date, to_char(end_date, 'dd-mon-yyyy')
from job_history
order by 1, 3;

select department_name, location_id, to_char(null) CITY
from departments
union
select 'See Below', location_id, city
from locations
order by 2;

SELECT employee_id, job_id,salary
FROM   employees
UNION
SELECT employee_id, job_id,0
FROM   job_history;