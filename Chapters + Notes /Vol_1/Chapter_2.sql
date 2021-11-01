select
    20 / 2 memebers_each_team,
    mod(20, 2) remaining_players
from
    dual;

select
    *
from
    dual;

select
    7 + 10 -1,
    'Plumbus'
from
    dual;

select
    lower('SQL cOURSE')
from
    dual;

select
    upper('sql course')
from
    dual;

select
    lower(first_name),
    upper(last_name)
from
    employees
select
    first_name,
    upper(last_name),
    salary
from
    employees
select
    initcap('sql cOUrse')
from
    dual;

select
    employee_id,
    first_name,
    upper(last_name)
from
    employees
where
    upper(last_name) = 'KING';

select
    employee_id,
    first_name,
    upper(last_name)
from
    employees
where
    lower(last_name) = 'king';

select
    employee_id,
    first_name,
    upper(last_name)
from
    employees
where
    lower(last_name) = lower('&last_name');

select
    'Hello' || ' World' || ' and good morning'
from
    dual;

select
    concat('Hello', ' World')
from
    dual;

select
    concat(first_name, last_name)
from
    employees;

select
    concat(first_name, '.')
from
    employees;

select
    concat(concat(first_name, '.'), last_name)
from
    employees;

select
    concat(concat(first_name, ' '), last_name)
from
    employees
select
    substr('Hello World', 1, 5)
from
    dual;

select
    substr('Hello World', 2, 3)
from
    dual;

select
    substr('Hello World', 2, 1)
from
    dual;

select
    substr(first_name, 1, 3)
from
    employees;

select
    substr(first_name, 1)
from
    employees;

select
    length('Hello World')
from
    dual;

select
    first_name,
    length(first_name)
from
    employees;

select
    instr('Hello World', 'W')
from
    dual;

select
    instr('Hello World', 'or')
from
    dual;

select
    first_name,
    instr(first_name, 'a')
from
    employees;

select
    lpad(salary, 10, '*')
from
    employees;

select
    rpad(salary, 10, '*')
from
    employees;

select
    replace('JACK and JUE', 'J', 'BL')
from
    dual;

select
    job_id,
    replace(job_id, 'REP', 'REPRESENTATIVE')
from
    employees
where
    job_id like '%REP';

select
    job_id,
    replace(
        replace(job_id, 'REP', 'REPRESENTATIVE'),
        'SA',
        'Sales'
    )
from
    employees
where
    job_id like '%REP';

select
    trim(
        'H'
        from
            'Hello World'
    )
from
    dual
select
    trim(
        leading 'H'
        from
            'Hello'
    )
from
    dual;

SELECT
    employee_id,
    CONCAT(first_name, last_name) NAME,
    job_id,
    LENGTH (last_name),
    INSTR(last_name, 'a') "Contains 'a'?"
FROM
    employees
WHERE
    SUBSTR(job_id, 4) = 'REP';

select
    round(45.926, 2)
from
    dual;

select
    round(45.924, 2)
from
    dual;

select
    round(45.924, 1)
from
    dual;

select
    round(45.924, 0)
from
    dual;

select
    round(45.425)
from
    dual;

select
    round(24598, -3)
from
    dual;

select
    round(24598, -2)
from
    dual;

select
    trunc(24.598, 2)
from
    dual;

select
    mod(24.598, 2)
from
    dual;

select
    mod(16, 3)
from
    dual;

select
    20 / 2 memebers_each_team,
    mod(20, 2) remaining_players
from
    dual;

select
    trunc(21 / 4, 0) memebers_each_team,
    mod(21, 4) remaining_players
from
    dual;

select
    mod(1600, 300)
from
    dual;

    select
    mod(1600, 300)
from
    dual;

SELECT
    TRUNC(45.923, 2),
    TRUNC(45.923),
    TRUNC(45.923, -1)
FROM
    DUAL;

SELECT
    last_name,
    salary,
    MOD(salary, 5000)
FROM
    employees
WHERE
    job_id = 'SA_REP';

select
    first_name,
    concat('£', salary)
from
    employees;

select
    first_name,
    salary
from
    employees;

/*
 display list of employees with employee id, first and last name showing thier salary in closest k figuire
 2500 = 25k
 */