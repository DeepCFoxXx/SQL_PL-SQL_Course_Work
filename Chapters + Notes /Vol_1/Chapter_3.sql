select sysdate
from dual;

select sysdate - hire_date
from employees;

select sysdate - hire_date, trunc(sysdate - hire_date ,0) DAYS_SINCE_HIRED
from employees;

select sysdate - hire_date, (sysdate - hire_date) / 7 WEEKS_SINCE_HIRED
from employees;

select sysdate - hire_date, (sysdate - hire_date) / 365.25 YEARS_SINCE_HIRED
from employees;

select employee_id, hire_date, months_between(sysdate, hire_date)
from employees;

select employee_id, hire_date, add_months(sysdate, 1)
from employees;

select employee_id, hire_date, add_months(hire_date,3)
from employees;

select next_day(sysdate, 'Friday')
from dual;

select next_day(sysdate, 7)
from dual;

select last_day(sysdate)
from dual;

select round(hire_date, 'month')
from employees;

select round(hire_date, 'year')
from employees;

select trunc(hire_date, 'month')
from employees;

select trunc(hire_date, 'year')
from employees;

select sum(salary)
from employees;

select employee_id, first_name, last_name, hire_date
from employees
where hire_date < '2-apr-98';

select employee_id, first_name, last_name, to_char(hire_date, 'dd-mm-yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'Day dd mm yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'fmDay dd/mm/yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'fmDy, dd/Month/yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'mm/dd/yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'fmDay/Month/year')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'fmDay/Month/year')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'Dy ddth/Mon/Year')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'dd/mmsp/yy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'dd/mmspth/yy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, 'ddth "of the" mm yyyy')
from employees;

select employee_id, first_name, last_name, to_char(hire_date, '"Day Was" dd mm yy "Time was" hh12-mi-ss pm')
from employees;

select sysdate, to_char(sysdate, 'hh12-Mi-ss PM')
from dual;

select sysdate, to_char(sysdate, 'hh24-Mi-ss PM')
from dual;

select salary, last_name, to_char(salary, 'L999999999.00') SAL
from employees;

SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM   employees
WHERE  last_name = 'Ernst';

select employee_id, first_name, last_name, hire_date, to_char(hire_date,'DD/MM/YY')
from employees
where to_char(hire_date,'DD/MM/YY') = '07/02/99';

select to_number('009836.00', '9999999.99')
from dual;

select employee_id, first_name, last_name, hire_date, to_char(hire_date,'DD/MM/YY')
from employees
where hire_date = to_date('May, 24, 1999','fxMonth, DD, YYYY');

SELECT last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('May 24, 1999', 'Month DD, YYYY');

SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY')
FROM  employees
WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-RR');