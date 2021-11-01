INSERT INTO departments (
    department_id,
    department_name,
    manager_id,
    location_id
) VALUES (
    280,
    'Public Relations',
    100,
    1700
);

DESC departments;

INSERT INTO departments (
    department_id,
    department_name,
    manager_id,
    location_id
) VALUES (
    290,
    'Interns',
    100,
    1700
);

SELECT
    *
FROM
    departments;

INSERT INTO departments VALUES (
    390,
    'New Department',
    NULL,
    NULL
);

INSERT INTO departments (
    department_id,
    department_name,
    manager_id,
    location_id
) VALUES (
    350,
    'New Department 350',
    100,
    1700
);

INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
) VALUES (
    113,
    'Louis',
    'Popp',
    'LPOPP1',
    '515.124.4567',
    sysdate,
    'AC_ACCOUNT',
    6900,
    NULL,
    205,
    110
);

INSERT INTO employees VALUES (
    114,
    'Den',
    'Raphealy',
    'DRAPHEAL',
    '515.127.4561',
    TO_DATE('FEB 3, 1999', 'MON DD, YYYY'),
    'SA_REP',
    11000,
    0.2,
    100,
    60
);

CREATE TABLE sales_reps (
    id              NUMBER(6, 0),
    name            VARCHAR2(25),
    salary          NUMBER(8, 2),
    commission_pct  NUMBER(2, 2)
)

SELECT
    *
FROM
    sales_reps;

INSERT INTO sales_reps (
    id,
    name,
    salary,
    commission_pct
)
    SELECT
        employee_id,
        last_name,
        salary,
        commission_pct
    FROM
        employees
    WHERE
        job_id LIKE '%REP%';

UPDATE employees
SET
    department_id = 50
WHERE
    employee_id = 113;

UPDATE employees
SET
    salary = 18000
WHERE
    employee_id = 113;

ROLLBACK;

DESC employees;

CREATE TABLE copy_emp (
    employee_id     NUMBER(6),
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(25),
    email           VARCHAR2(25),
    phone_number    VARCHAR2(20),
    hire_date       DATE,
    job_id          VARCHAR2(10),
    salary          NUMBER(8, 2),
    commission_pct  NUMBER(2, 2),
    manager_id      NUMBER(6),
    department_id   NUMBER(4)
);

INSERT INTO copy_emp
    SELECT
        *
    FROM
        employees;

SELECT
    *
FROM
    copy_emp;

UPDATE copy_emp
SET
    department_id = 110,
    salary = 9000;
 
ROLLBACK;

COMMIT;

UPDATE employees
SET
    job_id = (
        SELECT
            job_id
        FROM
            employees
        WHERE
            employee_id = 205
    ),
    salary = (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 205
    )
WHERE
    employee_id = 113;

DELETE FROM departments
WHERE
    department_name = 'Finance';

DELETE FROM copy_emp;

INSERT INTO departments VALUES (
    510,
    'Interanl',
    NULL,
    NULL
);

SELECT
    *
FROM
    departments
WHERE
    department_id = 510;

SELECT
    job_id,
    salary
FROM
    employees
WHERE
    employee_id = 205;
 
UPDATE employees
SET
    job_id = (
        SELECT
            job_id
        FROM
            employees
        WHERE
            employee_id = 205
    ),
    salary = (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 205
    )
WHERE
    employee_id = 113;

SAVEPOINT a;

DELETE FROM sales_rep;

SELECT
    *
FROM
    sales_reps;

TRUNCATE TABLE departments;