SELECT AVG(salary), MAX(salary) , MIN(salary), SUM(salary)

FROM employees

WHERE job_id LIKE '%REP%';

 

select min(hire_date), max(hire_date)

from employees;

 

select count(hire_date), count(hire_date)

from employees;

 

select count(employee_id)

from employees;

 

select count(*)

from employees;

 

select count(commission_pct)

from employees

where department_id =80;

 

SELECT COUNT(DISTINCT department_id)

FROM employees;

 

SELECT AVG(NVL(commission_pct, 0))

FROM employees;

 

select employee_id, first_name, last_name, salary

from employees

where salary = (select min(salary) from employees);

 

select employee_id, first_name, last_name, salary

from employees

where salary = 2100;

 

select employee_id, first_name, last_name, min(salary)

from employees; -- will error out due to all salary values being forced into one answer

 

select distinct department_id

from employees;

 

select count(commission_pct)

from employees;

 

select count(distinct department_id)

from employees;

 

select distinct department_id

from employees

where department_id != null;

 

SELECT AVG(commission_pct)

FROM employees;

 

SELECT AVG(NVL(commission_pct, 0))

FROM employees;

 

SELECT AVG(nvl(commission_pct, 0))

FROM employees;

 

select max(salary)

from employees

where department_id = 50;

 

SELECT department_id, AVG(salary)

FROM employees

GROUP BY department_id ;

 

select first_name, department_id, max(salary)

from employees

group by first_name, department_id;

 

SELECT department_id, job_id, SUM(salary)

FROM employees

WHERE department_id > 40

GROUP BY department_id, job_id

ORDER BY department_id;

 

select job_id, department_id, avg(salary)

from employees

group by job_id, department_id

order by 1;

 

select job_id, department_id, avg(salary)

from employees

where department_id > 40

group by job_id, department_id

order by 1;

 

select min(last_name)

from employees;

 

select count(first_name)

from employees;

 

select  department_id, count(*)

from employees

group by department_id;

 

SELECT department_id, avg(salary)

FROM employees

GROUP BY department_id

HAVING avg(salary) > 8000 ;

 

SELECT department_id, MAX(salary)

FROM employees

GROUP BY department_id

HAVING MAX(salary)>10000 ;

 

SELECT department_id, MAX(salary)

FROM employees

where salary > 10000

GROUP BY department_id;

 

SELECT job_id, SUM(salary) PAYROLL

FROM employees

WHERE job_id NOT LIKE '%REP%'

GROUP BY job_id

HAVING SUM(salary) > 13000

ORDER BY SUM(salary);

 

SELECT MAX(AVG(salary))

FROM employees

GROUP BY department_id;