select employee_id, last_name, salary, commission_pct, salary * 12 + salary * commission_pct * 12 Total_including_Commission
from employees;

select employee_id, salary, commission_pct, salary + nvl(commission_pct, 0) * salary
from employees;

SELECT last_name, salary, NVL(commission_pct, 0), (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM employees;

SELECT last_name, salary, commission_pct, NVL2(commission_pct, 'SAL+COMM', 'SAL') income
FROM employees
WHERE department_id IN (50, 80);

select employee_id, nvl(first_name, 'No First Name Present') first_name, last_name, job_id
from employees
where first_name = null;

SELECT employee_id, salary, commission_pct, NVL(commission_pct, '0009') com
FROM employees;

SELECT employee_id, salary, commission_pct, NVL(to_char(commission_pct, 0.00), 'No Commission') com
FROM employees;

select employee_id, last_name, salary, commission_pct, nvl2(commission_pct, 'Basic Sal + Commission', 'Basic') basic_or_comm
from employees;

SELECT first_name, LENGTH(first_name) "expr1", last_name, LENGTH(last_name) "expr2", NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM employees;

select first_name, LENGTH(first_name)
from employees;

select first_name, LENGTH(first_name), last_name, LENGTH(last_name)
from employees;

select first_name, LENGTH(first_name), last_name, LENGTH(last_name), NULLIF(LENGTH(first_name), LENGTH(last_name)) result
from employees;

select first_name, LENGTH(first_name), last_name, LENGTH(last_name),
       nvl(to_char(NULLIF(LENGTH(first_name), LENGTH(last_name))), 'Equal Lengths') result
from employees;

SELECT last_name, employee_id, COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission and no manager')
FROM employees;

SELECT last_name, job_id, salary,
       CASE job_id WHEN 'IT_PROG' THEN 1.10 * salary
       WHEN 'ST_CLERK' THEN 1.15 * salary
       WHEN 'SA_REP' THEN 1.20 * salary
       ELSE salary
       END "REVISED_SALARY"
FROM employees;

select last_name, job_id, salary as current_salary,
       CASE job_id WHEN 'IT_PROG' THEN 1.10 * salary
       WHEN 'ST_CLERK' THEN 1.15  *salary
       WHEN 'SA_REP' THEN 1.20 * salary
       ELSE salary
       END "REVISED_SALARY"
FROM employees;

select last_name, job_id, salary as current_salary,
       decode ( job_id , 'IT_PROG' , 1.10 * salary,
                'ST_CLERK' , 1.15  *salary,
                'SA_REP' , 1.20 * salary,
                salary )
        as "REVISED_SALARY"
FROM employees;

SELECT last_name, salary,
        DECODE (TRUNC(salary/2000, 0),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
        0.45) TAX_RATE
FROM employees
WHERE department_id = 80;

select employee_id, salary,
       decode(trunc(salary / 2000, 0), 0, 0.00,
                                       1, 0.09,
                                       2, 0.20,
                                       3, 0.30,
                                       4, 0.40,
                                       5, 0.42,
                                       6, 0.44,
                                       0.45)
        as tax_rate
from employees;