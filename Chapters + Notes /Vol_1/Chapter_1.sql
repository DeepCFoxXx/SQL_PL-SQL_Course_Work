select
    *
from
    employees
where
    employee_id = '203';

select
    *
from
    employees
where
    department_id = '180';

select
    distinct department_id
from
    employees;

select
    distinct department_id
from
    departments;

DESCRIBE employees;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    employee_id = '203';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    department_id = '90';

SELECT
    *
from
    employees
where
    department_id = '90';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    manager_id
from
    employees
where
    manager_id = '100';

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    last_name = 'King';

select
    1000 -100
from
    dual;

select
    employee_id,
    last_name,
    hire_date
from
    employees
where
    hire_date = '13-JAN-00';

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    salary <= 3000;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    salary <> 3000;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    last_name <> 'Taylor';

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    last_name != 'Taylor';

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    salary between 3000
    and 6000;

SELECT
    employee_id,
    first_name,
    last_name,
    salary
from
    employees
where
    salary between 12001
    and 16999;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    department_id in(80, 60, 50);

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like 'Tay%';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like 'W%n';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like 'A%n';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like '_h%';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like '%son%';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like '_% _%';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    first_name like 'v*%%' ESCAPE '%';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like 'v/%%' ESCAPE '/';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    last_name like 'Pa_%' ESCAPE '/';

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    manager_id
from
    employees
where
    manager_id is null;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    COMMISSION_PCT
from
    employees
where
    COMMISSION_PCT is null;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    department_id = 50
    and salary > 3000;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    department_id = 50
    and salary between 3000
    and 6000;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employees
where
    department_id = 50
    or salary > 3000;

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary >= 10000
    AND job_id LIKE '%MAN%';

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
where
    job_id = 'SA_REP';

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
where
    job_id != 'SA_REP';

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
where
    not job_id = 'SA_REP';

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    not job_id IN ('IT_PROG', 'ST_CLERK', 'SA_REP');

SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'SA_REP'
    OR job_id = 'AD_PRES'
    AND salary > 15000;

SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    (
        job_id = 'SA_REP'
        OR job_id = 'AD_PRES'
    )
    AND salary > 15000;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    first_name;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    first_name desc;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    1;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    2;

SELECT
    employee_id,
    first_name as First,
    last_name
FROM
    employees
order by
    First;

SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
where
    department_id = 50
order by
    3;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    first_name,
    last_name;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
order by
    first_name,
    last_name desc;

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
order by
    salary desc;

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary,
    hire_date
FROM
    employees
order by
    hire_date desc;

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary,
    hire_date
FROM
    employees
order by
    hire_date;

SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
where
    department_id = & Plumbus;

SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
where
    salary > & sal;

SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
where
    department_id = & Plumbus
    and salary > & sal;

SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
where
    last_name = & last_name;

SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
where
    last_name = '&last_name';

SELECT
    first_name,
    last_name,
    department_id,
    salary,
    hire_date
FROM
    employees
where
    hire_date > '&date';

SET
    VERIFY on
SELECT
    first_name,
    last_name,
    department_id,
    salary,
    & hire_date
FROM
    employees
where
    hire_date > '&date';

SET
    VERIFY on
SELECT
    first_name,
    last_name,
    department_id,
    salary,
    & hire_date
FROM
    employees
where
    hire_date > '&date';